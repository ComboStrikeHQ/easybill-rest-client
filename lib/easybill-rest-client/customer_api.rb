# frozen_string_literal: true
require 'easybill-rest-client/crud_operations'

module EasybillRestClient
  class CustomerApi
    include CrudOperations

    def initialize(api_client)
      @api_client = api_client
    end

    private

    attr_reader :api_client

    def resource_class
      Customer
    end

    def resource_name
      'customers'
    end
  end
end
