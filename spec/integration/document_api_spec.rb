RSpec.describe EasybillRestClient::DocumentApi, :vcr do
  subject do
    described_class.new(api_client)
  end

  describe '#find' do
    it 'returns a document' do
      document = subject.find(79121874)
      expect(document).to be_a(EasybillRestClient::Document)
      expect(document.number).to eq('XYZ-123')
      expect(document.address).to be_a(EasybillRestClient::DocumentAddress)
      expect(document.label_address).to be_a(EasybillRestClient::DocumentAddress)
      expect(document.items).to be_a(Array)
      expect(document.items.first).to be_a(EasybillRestClient::DocumentItem)
    end
  end

  describe '#find_all' do
    it 'returns documents' do
      documents = subject.find_all.to_a
      expect(documents.count).to eq(1)
      expect(documents.first.number).to eq('XYZ-123')
    end

    it 'returns documents by number' do
      documents = subject.find_all(number: 'XYZ-123').to_a
      expect(documents.count).to eq(1)
      expect(documents.first.number).to eq('XYZ-123')
    end
  end

  describe '#save' do
    it 'creates a document' do
      document = subject.save(EasybillRestClient::Document.new(number: 'Y'))
      expect(document.id).to eq(79126074)
      expect(document.number).to eq('Y')
    end

    it 'updates a document' do
      document = subject.save(EasybillRestClient::Document.new(id: 79125727, number: 'Z'))
      expect(subject.find(79125727).number).to eq('Z')
    end
  end

  describe '#get_pdf' do
    it 'returns a PDF' do
      document = subject.get_pdf(84718807)
      expect(document).to be_a(String)
      expect(document).to start_with('%PDF-1.4')
    end
  end

  describe '#documents_id_send_type_post' do
    it 'sends an email' do
      expect do
        subject.documents_id_send_type_post(61145172, 'email', {})
      end.to_not raise_error
    end
  end

  describe '#documents_id_done_put' do
    it 'marks a drafted document as finished' do
      expect(subject.documents_id_get(62331327).number).to be(nil)
      subject.documents_id_done_put(62331327)
      expect(subject.documents_id_get(62331327).number).to eq('201610037')
    end
  end
end
