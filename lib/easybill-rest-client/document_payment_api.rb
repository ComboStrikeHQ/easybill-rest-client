# frozen_string_literal: true
module EasybillRestClient
  class DocumentPaymentApi
    def initialize(api_client)
      @api_client = api_client
    end

    def find_all(params = {})
      api_client.request_collection(:get, '/document-payments', params)
        .map { |p| build_document_payment(p) }
    end

    def find(document_payment_id)
      build_document_payment(api_client.request(:get, "/document-payments/#{document_payment_id}"))
    end

    def delete(document_payment_id)
      api_client.request(:delete, "/document-payments/#{document_payment_id}")
    end

    def create(document_payment)
      build_document_payment(
        api_client.request(:post, '/document-payments', document_payment.attributes)
      )
    end

    private

    attr_reader :api_client

    def build_document_payment(params)
      DocumentPayment.new(params)
    end
  end
end
