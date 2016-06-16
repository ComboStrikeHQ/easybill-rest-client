# frozen_string_literal: true
module EasybillRestClient
  class GenericApi
    def self.new(resource_name, resource_class)
      Class.new do
        include InstanceMethods

        define_method(:resource_name) { resource_name }
        define_method(:resource_class) { resource_class }
      end
    end

    module InstanceMethods
      def initialize(api_client)
        @api_client = api_client
      end

      def find(id)
        build(api_client.request(:get, "/#{resource_name}/#{id}"))
      end

      def find_all(params = {})
        api_client.request_collection(:get, "/#{resource_name}", params).map { |d| build(d) }
      end

      def save(entity)
        entity.id ? update(entity) : create(entity)
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

      attr_reader :api_client
    end
  end
end
