# frozen_string_literal: true

RSpec.describe EasybillRestClient::GenericApi do
  class Resource
    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes
    end

    def id
      attributes[:id]
    end

    def method_missing(method)
      respond_to_missing?(method) ? attributes[method] : super
    end

    def respond_to_missing?(method)
      attributes.key?(method)
    end
  end

  class ApiClass < EasybillRestClient::GenericApi
    def resource_class
      Resource
    end

    def resource_name
      'resource'
    end
  end

  let(:api_client) { instance_double(EasybillRestClient::ApiClient) }

  subject(:api) { ApiClass.new(api_client) }

  describe '#save' do
    context 'entity does not exist' do
      it 'creates it' do
        expect(api_client).to receive(:request).with(:post, '/resource', foo: 'bar')

        api.save(Resource.new(foo: 'bar'))
      end
    end

    context 'entity does exist' do
      it 'updates it' do
        expect(api_client).to receive(:request).with(:put, '/resource/1', id: 1, foo: 'bar')

        api.save(Resource.new(id: 1, foo: 'bar'))
      end
    end
  end
end
