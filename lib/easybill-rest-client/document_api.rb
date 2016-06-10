# frozen_string_literal: true
require 'easybill-rest-client/generic_api'

module EasybillRestClient
  class DocumentApi < GenericApi.new('documents', Document)
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
  end
end
