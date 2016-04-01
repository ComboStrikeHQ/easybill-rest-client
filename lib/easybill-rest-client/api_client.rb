module EasybillRestClient
  class ApiClient
    BASE_URL = 'https://api.easybill.de/rest/v1'

    def initialize(config = {})
      @username = config[:username]
      @password = config[:password]
    end

    def request(method, endpoint, params = {})
      response = faraday.public_send(method) do |req|
        req.url "#{base_path}#{endpoint}"
        req.headers['Authorization'] = basic_auth_token
        req.params = params
      end
      response_body = JSON.parse(response.body, symbolize_names: true)
      if response.status != 200
        raise ApiError, response_body[:message]
      end
      response_body[:items]
    end

    private

    def base_path
      @base_path ||= URI.parse(BASE_URL).path
    end

    def basic_auth_token
      @auth_header ||= "Basic #{Base64.encode64("#{username}:#{password}").delete("\r\n")}"
    end

    def faraday
      @faraday ||= Faraday.new(url: BASE_URL)
    end

    attr_reader :username, :password
  end

  class ApiError < RuntimeError; end
end
