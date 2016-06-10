# frozen_string_literal: true
require 'easybill-rest-client/crud_operations'

module EasybillRestClient
  class DocumentApi
    include CrudOperations

    def initialize(api_client)
      @api_client = api_client
    end

    def get_pdf(document_id)
      api_client.request(:get, "/#{resource_name}/#{document_id}/pdf")
    end

    def send_email(document_id)
      api_client.request(:post, "/#{resource_name}/#{document_id}/send/email")
    end

    def finish(document_id)
      build(api_client.request(:put, "/#{resource_name}/#{document_id}/done"))
    end

    def cancel(document_id)
      build(api_client.request(:post, "/documents/#{document_id}/cancel"))
    end

    private

    attr_reader :api_client

    def resource_class
      Document
    end

    def resource_name
      'documents'
    end
  end
end
