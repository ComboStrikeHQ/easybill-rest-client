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

    it 'returns documents by number' do
      documents = subject.documents_get(number: '201610032')
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

  describe '#documents_id_pdf_get' do
    it 'returns a PDF' do
      document = subject.documents_id_pdf_get(61145172)
      expect(document.class).to be(File)
      expect(File.exist?(document.path)).to be(true)
      expect(document.size).to eq(168583)
    end
  end

  describe '#documents_id_send_type_post' do
    it 'sends an email' do
      expect do
        subject.documents_id_send_type_post(61145172, 'email', {})
      end.to_not raise_error
    end
  end
end
