module EasybillRestClient
  class CustomerApi
    def initialize(api_client)
      @api_client = api_client
    end

    def find(customer_id)
      build_object(api_client.request(:get, "/customers/#{customer_id}"))
    end

    def find_all(params = {})
      api_client.request_collection(:get, '/customers', params).map { |d| build_object(d) }
    end

    def create(params)
      build_object(api_client.request(:post, '/customers', params))
    end

    def update(customer_id, params)
      build_object(api_client.request(:put, "/customers/#{customer_id}", params))
    end

    def delete(customer_id)
      api_client.request(:delete, "/customers/#{customer_id}")
    end

    private

    attr_reader :api_client

    def build_object(params)
      Customer.new(params)
    end
  end
end
