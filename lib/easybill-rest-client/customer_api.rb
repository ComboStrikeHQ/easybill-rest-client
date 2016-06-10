# frozen_string_literal: true
require 'easybill-rest-client/generic_api'

module EasybillRestClient
  CustomerApi = GenericApi.new('customers', Customer)
end
