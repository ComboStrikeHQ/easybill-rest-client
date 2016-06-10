# frozen_string_literal: true
require 'easybill-rest-client/generic_api'

module EasybillRestClient
  DocumentPaymentApi = GenericApi.new('document-payments', DocumentPayment)
end
