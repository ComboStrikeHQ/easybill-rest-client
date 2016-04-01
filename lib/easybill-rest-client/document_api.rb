module EasybillRestClient
  class DocumentApi
    def initialize(api_client)
      @api_client = api_client
    end

    def find(id)
      build_document(api_client.request(:get, "/documents/#{id}"))
    end

    def find_all(params = {})
      api_client.request(:get, '/documents').map { |d| build_document(d) }
    end

    def store(document)
      if document.id
        build_document(api_client.request(:put, "/documents/#{document.id}", document.attributes))
      else
        build_document(api_client.request(:post, '/documents', document.attributes))
      end
    end

    private

    attr_reader :api_client

    def build_document(hash)
      hash[:document_date] &&= Date.parse(hash[:document_date])
      hash[:due_date] &&= Date.parse(hash[:due_date])
      hash[:paid_at] &&= Date.parse(hash[:paid_at])
      hash[:address][:personal] = false if hash[:address][:personal].nil?
      # TODO: dry-types does not seem to support optional structs as attributes,
      # so we ignore this for now, since we don't use it anyway.
      hash.delete(:recurring_options)
      Document.new(
        hash.merge(
          created_at: DateTime.parse(hash[:created_at]),
          # address: DocumentAddress.new(hash[:address]),
          # label_address: DocumentAddress.new(hash[:label_address]),
          items: items(hash),
          # recurring_options: DocumentRecurringOptions.new(hash[:recurring_options]),
          # service_date: DocumentServiceDate.new(hash[:service_date])
        )
      )
    end

    def items(hash)
      hash[:items].map do |item|
        item[:quantity] = nil if item[:quantity] == false
        item
      end
    end
  end
end
