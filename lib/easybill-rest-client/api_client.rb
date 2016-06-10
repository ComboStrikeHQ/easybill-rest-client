module EasybillRestClient
  class ApiClient
    BASE_URL = 'https://api.easybill.de/rest/v1'

    def initialize(api_key:)
      @api_key = api_key
    end

    def request_collection(method, endpoint, params = {})
      fetch_pages do |page|
        request(method, endpoint, params.merge(page: page))
      end
    end

    def request(method, endpoint, params = {}, body = nil)
      response = faraday.public_send(method) do |req|
        req.url "#{base_path}#{endpoint}"
        req.headers['Authorization'] = basic_auth_token
        if %i(put post).include?(method)
          req.body = params.reject { |_k, v| v.nil? }.to_json
        else
          req.params = params
        end
      end
      response_body =
        if response.headers['content-type'] == 'application/json'
          JSON.parse(response.body, symbolize_names: true)
        else
          response.body
        end
      raise TooManyRequests if response.status == 429
      unless response.status.to_s.start_with?('2')
        raise ApiError, response_body[:message]
      end
      response_body.length > 0 ? response_body : nil
    end

    private

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

    attr_reader :api_key
  end

  class ApiError < RuntimeError; end
  class TooManyRequests < ApiError; end
end
