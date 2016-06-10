require 'retryable'

module EasybillRestClient
  class ApiClient
    BASE_URL = 'https://api.easybill.de/rest/v1'
    DEFAULT_RETRY_COOL_OFF_TIME = 15
    DEFAULT_TRIES = 5

    def initialize(api_key:, retry_cool_off_time: DEFAULT_RETRY_COOL_OFF_TIME, tries: DEFAULT_TRIES)
      @api_key = api_key
      @retry_cool_off_time = retry_cool_off_time
      @tries = tries
    end

    def request_collection(method, endpoint, params = {})
      fetch_pages do |page|
        request(method, endpoint, params.merge(page: page))
      end
    end

    def request(method, endpoint, params = {})
      Retryable.retryable(
        tries: tries,
        sleep: retry_cool_off_time,
        on: EasybillRestClient::TooManyRequests
      ) do
        response = perform_request(method, endpoint, params)
        response_body = process_response(response)
        response_body.length > 0 ? response_body : nil
      end
    end

    private

    def perform_request(method, endpoint, params)
      faraday.public_send(method) do |req|
        req.url "#{base_path}#{endpoint}"
        req.headers['Authorization'] = basic_auth_token
        if %i(put post).include?(method)
          req.body = params.reject { |_k, v| v.nil? }.to_json
        else
          req.params = params
        end
      end
    end

    def process_response(response)
      raise TooManyRequests if response.status == 429
      body = extract_response_body(response)
      unless response.status.to_s.start_with?('2')
        raise ApiError, body[:message]
      end
      body
    end

    def extract_response_body(response)
      if response.headers['content-type'] == 'application/json'
        JSON.parse(response.body, symbolize_names: true)
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
      @auth_header ||= "Basic #{Base64.encode64("rest-api@easybill.de:#{api_key}").delete("\r\n")}"
    end

    def faraday
      @faraday ||= Faraday.new(url: BASE_URL)
    end

    attr_reader :api_key, :retry_cool_off_time, :tries
  end

  class ApiError < RuntimeError; end
  class TooManyRequests < ApiError; end
end
