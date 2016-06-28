# frozen_string_literal: true
require 'retryable'
require 'json'
require 'logger'
require 'net/http'

require 'easybill-rest-client/request_builder'

module EasybillRestClient
  class ApiClient
    DEFAULT_RETRY_COOL_OFF_TIME = 15
    DEFAULT_TRIES = 5
    MAX_PAGE_SIZE = 1000

    def initialize(options = {})
      @api_key = options.fetch(:api_key)
      @retry_cool_off_time = options.fetch(:retry_cool_off_time, DEFAULT_RETRY_COOL_OFF_TIME)
      @tries = options.fetch(:tries, DEFAULT_TRIES)
      @logger = options.fetch(:logger, Logger.new($stdout))
    end

    def request_collection(method, endpoint, params = {})
      fetch_pages do |page|
        request(method, endpoint, params.merge(page: page, limit: MAX_PAGE_SIZE))
      end
    end

    def request(method, endpoint, params = {})
      Retryable.retryable(
        tries: tries,
        sleep: retry_cool_off_time,
        on: EasybillRestClient::TooManyRequests
      ) do
        response = perform_request(method, endpoint, params)
        process_response(response)
      end
    end

    private

    def perform_request(method, endpoint, params)
      request_builder = RequestBuilder.new(method)
      uri = request_builder.build_uri(endpoint, params)
      request = request_builder.build_request(api_key, uri.request_uri, params)
      request_details = request_builder.request_details(uri, request)
      log_request(method, endpoint, request_details)

      Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request(request)
      end
    end

    def log_request(method, endpoint, params)
      json_params = params.is_a?(String) ? params : params.to_json
      logger.info("[easybill-rest-client] #{method.to_s.upcase} #{endpoint} #{json_params}")
    end

    def process_response(response)
      raise TooManyRequests if response.is_a?(Net::HTTPTooManyRequests)
      body = extract_response_body(response)
      unless response.is_a?(Net::HTTPSuccess)
        message = body.is_a?(Hash) ? body[:message] : body
        raise ApiError, message
      end
      body && !body.empty? ? body : nil
    end

    def extract_response_body(response)
      return unless response.class.body_permitted?
      case response.content_type
      when 'application/json'
        JSON.parse(response.body, symbolize_names: true)
      when 'application/pdf'
        /\Wfilename="(?<filename>.*?)"/ =~ response.fetch('content-disposition')
        Pdf.new(filename: filename, content: response.body)
      else
        response.body
      end
    end

    def fetch_pages
      Enumerator.new do |y|
        page = 1
        loop do
          collection = yield(page)
          collection[:items].each do |item|
            y << item
          end
          break if collection[:page] >= collection[:pages]
          page += 1
        end
      end.lazy
    end

    attr_reader :api_key, :retry_cool_off_time, :tries, :logger
  end

  class ApiError < RuntimeError; end
  class TooManyRequests < ApiError; end
end
