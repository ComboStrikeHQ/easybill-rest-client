# frozen_string_literal: true
require 'retryable'
require 'json'
require 'logger'

module EasybillRestClient
  class ApiClient
    BASE_URL = 'https://api.easybill.de/rest/v1'
    DEFAULT_RETRY_COOL_OFF_TIME = 15
    DEFAULT_TRIES = 5
    MAX_PAGE_SIZE = 1000
    USERNAME = 'rest-api@easybill.de'

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
      faraday.public_send(method) do |req|
        req.url "#{base_path}#{endpoint}"
        req.headers['Authorization'] = basic_auth_token
        if %i(put post).include?(method)
          json_params = params.reject { |_k, v| v.nil? }.to_json
          log_request(method, endpoint, json_params)
          req.body = json_params
        else
          normalized_params = comma_separate_arrays(params.dup)
          log_request(method, endpoint, normalized_params)
          req.params = normalized_params
        end
      end
    end

    def comma_separate_arrays(params)
      params.map { |k, v| [k, v.is_a?(Array) ? v.join(',') : v] }.to_h
    end

    def log_request(method, endpoint, params)
      json_params = params.is_a?(String) ? params : params.to_json
      logger.info("[easybill-rest-client] #{method.to_s.upcase} #{endpoint} #{json_params}")
    end

    def process_response(response)
      raise TooManyRequests if response.status == 429
      body = extract_response_body(response)
      unless response.status.to_s.start_with?('2')
        raise ApiError, body[:message]
      end
      !body.empty? ? body : nil
    end

    def extract_response_body(response)
      case response.headers.fetch('content-type')
      when 'application/json'
        JSON.parse(response.body, symbolize_names: true)
      when 'application/pdf'
        /\Wfilename="(?<filename>.*?)"/ =~ response.headers.fetch('content-disposition')
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

    def base_path
      @base_path ||= URI.parse(BASE_URL).path
    end

    def basic_auth_token
      @auth_header ||= "Basic #{Base64.encode64("#{USERNAME}:#{api_key}").delete("\r\n")}"
    end

    def faraday
      @faraday ||= Faraday.new(url: BASE_URL)
    end

    attr_reader :api_key, :retry_cool_off_time, :tries, :logger
  end

  class ApiError < RuntimeError; end
  class TooManyRequests < ApiError; end
end
