# frozen_string_literal: true
require 'easybill-rest-client/generic_api'

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
