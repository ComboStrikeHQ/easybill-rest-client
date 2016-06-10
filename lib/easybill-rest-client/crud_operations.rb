# frozen_string_literal: true
module EasybillRestClient
  module CrudOperations
    def find(id)
      build(api_client.request(:get, "/#{resource_name}/#{id}"))
    end

    def find_all(params = {})
      api_client.request_collection(:get, "/#{resource_name}", params).map { |d| build(d) }
    end

    def create(entity)
      build(api_client.request(:post, "/#{resource_name}", entity.attributes))
    end

    def update(entity)
      build(api_client.request(:put, "/#{resource_name}/#{entity.id}", entity.attributes))
    end

    def delete(id)
      api_client.request(:delete, "/#{resource_name}/#{id}")
    end

    def build(params)
      resource_class.new(params)
    end
  end
end
