# frozen_string_literal: true
module SetupDocument
  def setup_finished_document(opts = {})
    customer_api = EasybillRestClient::CustomerApi.new(api_client)
    document_api = EasybillRestClient::DocumentApi.new(api_client)

    unless opts[:customer_id]
      customer_number = 'test-123'
      customer = customer_api.customers_get(number: customer_number).items.first ||
        customer_api.customers_post(number: customer_number,
                                    company_name: 'ACME Inc.',
                                    last_name: 'Patternman')
      opts[:customer_id] = customer.id
    end

    document = document_api.documents_post(opts)
    document_api.documents_id_done_put(document.id)
    document
  end
end
