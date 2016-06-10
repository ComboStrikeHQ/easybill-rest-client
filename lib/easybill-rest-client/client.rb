# frozen_string_literal: true
require 'easybill-rest-client/api_client'
require 'easybill-rest-client/customer_api'
require 'easybill-rest-client/document_api'
require 'easybill-rest-client/post_box_api'

module EasybillRestClient
  class Client
    def initialize(api_key)
      @api_key = api_key
    end

    def customers
      @customer_api ||= CustomerApi.new(api_client)
    end

    def documents
      @document_api ||= DocumentApi.new(api_client)
    end

    def post_boxes
      @document_api ||= PostBoxApi.new(api_client)
    end

    def document_payments
      @document_payments ||= DocumentPaymentApi.new(api_client)
    end

    private

    attr_reader :api_key

    def api_client
      @api_client ||= ApiClient.new(api_key: api_key)
    end
  end
end
