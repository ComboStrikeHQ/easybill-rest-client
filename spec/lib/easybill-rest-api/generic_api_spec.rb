# frozen_string_literal: true

RSpec.describe EasybillRestClient::GenericApi do
  let(:api_client) { double('ApiClient') }
  let(:resource_name) { 'resource' }
  let(:resource_class) { 'Resource' }
  subject { described_class.new(resource_name, resource_class).new(api_client) }

  describe '#save' do
    context 'entity does not exist' do
      let(:entity) { double('entity', id: nil) }

      it 'creates it' do
        expect(subject).to receive(:create).with(entity)
        subject.save(entity)
      end
    end

    context 'entity does not exist' do
      let(:entity) { double('entity', id: 1) }

      it 'creates it' do
        expect(subject).to receive(:update).with(entity)
        subject.save(entity)
      end
    end
  end
end
