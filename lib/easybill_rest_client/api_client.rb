# frozen_string_literal: true
require 'retryable'
require 'json'
require 'logger'
require 'net/http'

require 'easybill_rest_client/request_builder'

module EasybillRestClient
  class ApiClient
    DEFAULT_RETRY_COOL_OFF_TIME = 15
    DEFAULT_TRIES = 5
    MAX_PAGE_SIZE = 1000
    OPEN_TIMEOUT = 5

    def initialize(options = {})
      @api_key = options.fetch(:api_key)
      @retry_cool_off_time = options.fetch(:retry_cool_off_time, DEFAULT_RETRY_COOL_OFF_TIME)
      @tries = options.fetch(:tries, DEFAULT_TRIES)
      @logger = options.fetch(:logger, Logger.new($stdout))
      @logger.formatter = log_formatter
    end

    def request_collection(method, endpoint, params = {})
      fetch_pages do |page|
        request(method, endpoint, params.merge(page: page, limit: MAX_PAGE_SIZE))
      end
    end

    def request(method, endpoint, params = {})
      self.request_id = Time.now.to_f
      retry_on(EasybillRestClient::TooManyRequests) do |too_many_request_retries|
        logger.warn('Too many request!') if too_many_request_retries > 0
        retry_on(Net::OpenTimeout) do |open_timeout_retries|
          if open_timeout_retries > 0
            logger.warn("Unable to open connection after #{OPEN_TIMEOUT}s, retrying...")
          end
          response = perform_request(method, endpoint, params)
          process_response(response)
        end
      end
    rescue => e
      logger.error("Request failed due to: #{e.class}: #{e.message}")
      raise
    end

    private

    def retry_on(klass)
      opts = {
        EasybillRestClient::TooManyRequests => { tries: tries, sleep: retry_cool_off_time, on: klass },
        Net::OpenTimeout => { tries: tries, sleep: 0, on: klass }
      }.fetch(klass)

      Retryable.retryable(opts) do |retries|
        yield(retries)
      end
    end

    def perform_request(method, endpoint, params)
      request_builder = RequestBuilder.new(method)
      uri = request_builder.build_uri(endpoint, params)
      request = request_builder.build_request(api_key, uri.request_uri, params)
      request_details = request_builder.request_details(uri, request)
      log_request(method, endpoint, request_details)

      Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.open_timeout = OPEN_TIMEOUT
        http.request(request)
      end
    end

    def log_request(method, endpoint, params)
      logger.info("#{method.to_s.upcase} #{endpoint} #{params}")
    end

    def log_formatter
      formatter = Logger::Formatter.new
      lambda do |severity, datetime, progname, msg|
        string = "[easybill-rest-client] RequestID=#{request_id} #{msg}"
        formatter.call(severity, datetime, progname, string)
      end
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
    attr_accessor :request_id
  end

  class ApiError < RuntimeError; end
  class TooManyRequests < ApiError; end
end
