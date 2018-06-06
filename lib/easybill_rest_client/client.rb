# frozen_string_literal: true

require 'easybill_rest_client/api_client'
require 'easybill_rest_client/customer_api'
require 'easybill_rest_client/document_api'
require 'easybill_rest_client/post_box_api'
require 'easybill_rest_client/document_payment_api'

module EasybillRestClient
  class Client
    def initialize(options = {})
      @options = options
    end

    def customers
      @customers ||= CustomerApi.new(api_client)
    end

    def documents
      @documents ||= DocumentApi.new(api_client)
    end

    def post_boxes
      @post_boxes ||= PostBoxApi.new(api_client)
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
