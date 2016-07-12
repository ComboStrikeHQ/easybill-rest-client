# frozen_string_literal: true
require 'retryable'
require 'json'
require 'logger'
require 'net/http'
require 'securerandom'

require 'easybill_rest_client/request_logger'
require 'easybill_rest_client/request'
require 'easybill_rest_client/response'

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
    end

    def request_collection(method, endpoint, params = {})
      fetch_pages do |page|
        request(method, endpoint, params.merge(page: page, limit: MAX_PAGE_SIZE))
      end
    end

    def request(method, endpoint, params = {})
      @request_logger = RequestLogger.new(logger: logger, request_id: SecureRandom.hex)
      retry_on(EasybillRestClient::TooManyRequests) do
        retry_on(Net::OpenTimeout) do
          perform_request(method, endpoint, params).body
        end
      end
    rescue => e
      request_logger.error("Request failed due to: #{e.class}: #{e.message}")
      raise
    end

    private

    def retry_on(klass, &block)
      Retryable.retryable(retryable_opts(klass), &block)
    end

    def retryable_opts(klass)
      {
        EasybillRestClient::TooManyRequests => {
          tries: tries,
          sleep: retry_cool_off_time,
          on: klass,
          exception_cb: method(:log_too_many_requests)
        },
        Net::OpenTimeout => {
          tries: tries,
          sleep: 0,
          on: klass,
          exception_cb: method(:log_open_timeout)
        }
      }.fetch(klass)
    end

    def log_open_timeout(_exception)
      request_logger.warn("Unable to open connection after #{OPEN_TIMEOUT}s, retrying...")
    end

    def log_too_many_requests(_exception)
      request_logger.warn('Too many request!')
    end

    def perform_request(method, endpoint, params)
      request = Request.new(api_key, method, endpoint, params)
      request_logger.info("#{method.to_s.upcase} #{endpoint} #{request.request_details}")
      Response.new(request.run)
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

    attr_reader :api_key, :retry_cool_off_time, :tries, :logger, :request_logger
  end

  class ApiError < RuntimeError; end
  class TooManyRequests < ApiError; end
end
