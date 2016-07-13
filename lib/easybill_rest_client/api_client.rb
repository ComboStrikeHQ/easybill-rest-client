# frozen_string_literal: true
require 'json'
require 'logger'
require 'net/http'
require 'securerandom'

require 'easybill_rest_client/request'
require 'easybill_rest_client/response'

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
      request = Request.new(
        api_key: api_key,
        method: method,
        endpoint: endpoint,
        params: params,
        logger: logger,
        tries: tries,
        retry_cool_off_time: retry_cool_off_time
      )
      Response.new(request.run).body
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

    attr_reader :api_key, :retry_cool_off_time, :tries, :logger
  end
end
