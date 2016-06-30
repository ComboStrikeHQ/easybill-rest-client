# frozen_string_literal: true
module EasybillRestClient
  class RequestBuilder
    BASE_URL = 'https://api.easybill.de/rest/v1'
    USERNAME = 'rest-api@easybill.de'
    SUPPORTED_METHODS = %i(get post put delete).freeze
    HTTP_METHODS_ALLOWING_BODY = %i(post put).freeze

    def initialize(method)
      unless SUPPORTED_METHODS.include?(method.to_sym)
        raise ArgumentError, "Unsupported HTTP method '#{method}'"
      end

      @method = method
    end

    def build_uri(endpoint, params)
      uri = URI.parse(BASE_URL)
      uri.path << endpoint
      uri.query = URI.encode_www_form(comma_separate_arrays(params.dup)) unless body_allowed?
      uri
    end

    def build_request(api_key, path, params)
      request = request_class.new(path)
      request.body = params.reject { |_k, v| v.nil? }.to_json if body_allowed?
      request.basic_auth(USERNAME, api_key)
      request
    end

    def request_details(uri, request)
      body_allowed? ? request.body : uri.query
    end

    private

    attr_reader :method

    def request_class
      Net::HTTP.const_get(method.to_s.capitalize)
    end

    def body_allowed?
      HTTP_METHODS_ALLOWING_BODY.include? method
    end

    def comma_separate_arrays(params)
      params.map { |k, v| [k, v.is_a?(Array) ? v.join(',') : v] }.to_h
    end
  end
end
