RSpec.describe Easybill::DocumentApi, :vcr do
  subject do
    described_class.new(api_client)
  end

  describe '#documents_get' do
    it 'returns documents' do
      documents = subject.documents_get(type: 'INVOICE')
      expect(documents.items.count).to eq(1)
      expect(documents.items.first.number).to eq('201610032')
    end
  end

  describe '#documents_post' do
    it 'creates a document' do
      document = subject.documents_post({})
      expect(document.id).to eq(61260835)
    end
  end

  describe '#documents_id_get' do
    it 'returns a document' do
      document = subject.documents_id_get(61145172)
      expect(document.id).to eq(61145172)
    end
  end
end
