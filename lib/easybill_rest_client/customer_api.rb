# frozen_string_literal: true
require 'easybill_rest_client/generic_api'

module EasybillRestClient
  class CustomerApi < GenericApi
    def resource_name
      'customers'
    end

    def resource_class
      Customer
    end
  end
end
