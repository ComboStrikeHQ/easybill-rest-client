# frozen_string_literal: true

RSpec.describe EasybillRestClient::DocumentApi, :vcr do
  subject(:api) { client.documents }

  describe '#find' do
    it 'returns a document' do
      document = api.find(79121874)
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
      documents = api.find_all.to_a
      expect(documents.count).to eq(1)
      expect(documents.first.number).to eq('XYZ-123')
    end

    it 'returns documents by number' do
      documents = api.find_all(number: 'XYZ-123').to_a
      expect(documents.count).to eq(1)
      expect(documents.first.number).to eq('XYZ-123')
    end

    context 'paid and unpaid documents exist' do
      let(:customer) do
        client.customers.create(
          EasybillRestClient::Customer.new(last_name: 'Mustermann',
                                           company_name: 'ACME Corp.')
        )
      end

      let(:unpaid_document) do
        d = api.create(EasybillRestClient::Document.new(customer_id: customer.id))
        api.finish(d.id)
      end

      let(:paid_document) do
        d = api.create(EasybillRestClient::Document.new(customer_id: customer.id))
        api.finish(d.id)
        client.document_payments.create(
          EasybillRestClient::DocumentPayment.new(document_id: d.id,
                                                  paid: true,
                                                  amount: 0)
        )
        d
      end

      after do
        api.delete(paid_document.id)
        api.delete(unpaid_document.id)
        client.customers.delete(customer.id)
      end

      it 'returns only unpaid documents' do
        documents = api.find_all(paid_at: nil,
                                 number: [paid_document.number, unpaid_document.number])
        expect(documents.count).to eq(1)
        expect(documents.first.paid_at).to be_nil
        expect(documents.first.id).to eq(unpaid_document.id)
      end
    end
  end

  describe '#create' do
    it 'creates a document' do
      document = api.create(api.build(number: 'Y'))
      expect(document.id).to eq(79126074)
      expect(document.number).to eq('Y')
    end
  end

  describe '#update' do
    it 'updates a document' do
      api.update(api.build(id: 79125727, number: 'Z'))
      expect(api.find(79125727).number).to eq('Z')
    end
  end

  describe '#get_pdf' do
    it 'returns a PDF' do
      document = api.get_pdf(84718807)
      expect(document).to be_a(EasybillRestClient::Pdf)
      expect(document.filename).to eq('Rechnung-C1606-16178-154086.pdf')
      expect(document.content).to start_with('%PDF-1.4')
    end
  end

  describe '#send_email' do
    it 'sends an email' do
      expect(api.send_email(84718807)).to be_nil
    end

    it 'passes on additional params' do
      expect(api.send_email(257330466, to: 'developers@ad2games.com')).to be_nil
    end
  end

  describe '#finish' do
    it 'marks a drafted document as finished' do
      expect(api.find(84725627).number).to be_nil
      expect(api.finish(84725627)).to be_a(EasybillRestClient::Document)
      expect(api.find(84725627).number).to be_a(String)
    end
  end

  describe '#delete' do
    it 'deletes a document' do
      expect(api.find(84718807)).not_to be_nil
      expect(api.delete(84718807)).to be_nil
      expect { api.find(84718807) }
        .to raise_error(EasybillRestClient::ApiError, /Document#84718807 not found./)
    end
  end

  describe '#cancel' do
    it 'cancels a document' do
      expect(api.find(84727902).cancel_id).to be_nil
      expect(api.cancel(84727902)).to be_a(EasybillRestClient::Document)
      expect(api.find(84727902).cancel_id).to be_a(Integer)
    end
  end
end
