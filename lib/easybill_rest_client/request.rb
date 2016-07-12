# frozen_string_literal: true
module EasybillRestClient
  class Request
    BASE_URL = 'https://api.easybill.de/rest/v1'
    USERNAME = 'rest-api@easybill.de'
    SUPPORTED_METHODS = %i(get post put delete).freeze

    def initialize(api_key, method, endpoint, params)
      unless SUPPORTED_METHODS.include?(method.to_sym)
        raise ArgumentError, "Unsupported HTTP method '#{method}'"
      end

      @api_key = api_key
      @method = method
      @endpoint = endpoint
      @params = params
    end

    def run
      Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.open_timeout = ApiClient::OPEN_TIMEOUT
        http.request(request)
      end
    end

    def request_details
      body_allowed? ? request.body : uri.query
    end

    private

    attr_reader :api_key, :method, :endpoint, :params

    def uri
      return @uri if @uri
      @uri = URI.parse(BASE_URL)
      @uri.path << endpoint
      @uri.query = URI.encode_www_form(comma_separate_arrays(params.dup)) unless body_allowed?
      @uri
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

    def comma_separate_arrays(params)
      params.map { |k, v| [k, v.is_a?(Array) ? v.join(',') : v] }.to_h
    end
  end
end
