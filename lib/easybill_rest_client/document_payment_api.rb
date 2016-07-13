# frozen_string_literal: true
require 'easybill_rest_client/generic_api'

module EasybillRestClient
  class DocumentPaymentApi < GenericApi
    def resource_name
      'document-payments'
    end

    def resource_class
      DocumentPayment
    end
  end
end
