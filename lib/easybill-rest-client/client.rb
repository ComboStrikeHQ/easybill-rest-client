# frozen_string_literal: true
require 'easybill-rest-client/api_client'
require 'easybill-rest-client/customer_api'
require 'easybill-rest-client/document_api'
require 'easybill-rest-client/post_box_api'
require 'easybill-rest-client/document_payment_api'

module EasybillRestClient
  class Client
    def initialize(options = {})
      @options = options
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

    attr_reader :options

    def api_client
      @api_client ||= ApiClient.new(options)
    end
  end
end
