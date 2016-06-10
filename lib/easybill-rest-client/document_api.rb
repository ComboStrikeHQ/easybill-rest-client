module EasybillRestClient
  class DocumentApi
    def initialize(api_client)
      @api_client = api_client
    end

    def find(id)
      build_document(api_client.request(:get, "/documents/#{id}"))
    end

    def find_all(params = {})
      api_client.request_collection(:get, '/documents', params).map { |d| build_document(d) }
    end

    def save(document)
      if document.id
        build_document(api_client.request(:put, "/documents/#{document.id}", document.attributes))
      else
        build_document(api_client.request(:post, '/documents', document.attributes))
      end
    end

    def get_pdf(document_id)
      api_client.request(:get, "/documents/#{document_id}/pdf")
    end

    private

    attr_reader :api_client

    def build_document(params)
      Document.new(params)
    end
  end
end
