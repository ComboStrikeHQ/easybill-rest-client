# frozen_string_literal: true
require 'easybill_rest_client/request_logger'
require 'easybill_rest_client/retry_on'

module EasybillRestClient
  class Request
    BASE_URL = 'https://api.easybill.de/rest/v1'
    USERNAME = 'rest-api@easybill.de'
    SUPPORTED_METHODS = %i(get post put delete).freeze
    OPEN_TIMEOUT = 5

    def initialize(opts = {})
      unless SUPPORTED_METHODS.include?(opts.fetch(:method).to_sym)
        raise ArgumentError, "Unsupported HTTP method '#{method}'"
      end

      @api_key = opts.fetch(:api_key)
      @method = opts.fetch(:method)
      @endpoint = opts.fetch(:endpoint)
      @params = opts.fetch(:params)
      @logger = opts.fetch(:logger)
      @tries = opts.fetch(:tries)
      @retry_cool_off_time = opts.fetch(:retry_cool_off_time)
    end

    def run
      request_logger.info("#{method.to_s.upcase} #{endpoint} #{request_details}")
      retry_on(TooManyRequests) do
        retry_on(Net::OpenTimeout) do
          response = perform_request
          raise TooManyRequests if response.is_a?(Net::HTTPTooManyRequests)
          response
        end
      end
    end

    def request_details
      body_allowed? ? request.body : uri.query
    end

    private

    attr_reader :api_key, :method, :endpoint, :params, :logger, :request_logger, :retry_on, :tries,
      :retry_cool_off_time

    def perform_request
      http_opts = { use_ssl: uri.scheme == 'https', open_timeout: OPEN_TIMEOUT }
      Net::HTTP.start(uri.host, uri.port, http_opts) do |http|
        http.request(request)
      end
    end

    def uri
      return @uri if @uri
      @uri = URI.parse(BASE_URL)
      @uri.path << endpoint
      @uri.query = URI.encode_www_form(query_params) unless body_allowed?
      @uri
    end

    def query_params
      params.map { |key, value| [key, translate_query_value(value)] }.to_h
    end

    def translate_query_value(value)
      case value
      when Array
        value.join(',')
      when nil
        'null'
      else
        value
      end
    end

    def request
      return @request if @request
      @request = request_class.new(uri)
      @request.body = params.reject { |_k, v| v.nil? }.to_json if body_allowed?
      @request.basic_auth(USERNAME, api_key)
      @request
    end

    def request_class
      Net::HTTP.const_get(method.to_s.capitalize)
    end

    def body_allowed?
      request_class::REQUEST_HAS_BODY
    end

    def retry_on(exception, &block)
      @retry_on ||= RetryOn.new(request_logger, tries, retry_cool_off_time)
      @retry_on.retry_on(exception, &block)
    end

    def request_logger
      @request_logger ||= RequestLogger.new(logger: logger, request_id: request_id)
    end

    def request_id
      @request_id ||= SecureRandom.hex(3)
    end
  end

  class TooManyRequests < StandardError; end
end
