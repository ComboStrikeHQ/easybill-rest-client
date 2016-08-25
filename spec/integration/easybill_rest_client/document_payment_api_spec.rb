# frozen_string_literal: true
RSpec.describe EasybillRestClient::DocumentPaymentApi, :vcr do
  subject(:api) { client.document_payments }

  describe '#find_all' do
    it 'returns document payments' do
      payments = api.find_all.to_a
      expect(payments.last.id).to be_a(Fixnum)
    end
  end

  describe '#find' do
    it 'returns a document payment' do
      payment = api.find(74692458)
      expect(payment.id).to eq(74692458)
      expect(payment.amount).to eq(3367)
      expect(payment.document_id).to eq(84730384)
      expect(payment.notice).to eq('Blah!')
      expect(payment.payment_at).to eq(Date.new(2016, 6, 10))
      expect(payment.type).to eq('Überweisung')
    end
  end

  describe '#delete' do
    it 'deletes a document payment' do
      expect(api.find(74692458)).to be_a(EasybillRestClient::DocumentPayment)
      expect(api.delete(74692458)).to be_nil
      expect { api.find(74692458) }
        .to raise_error(EasybillRestClient::ApiError, /DocumentPayment#74692458 not found./)
    end
  end

  describe '#create' do
    let(:document_payment) do
      api.build(document_id: 84730384,
                amount: 3367,
                notice: 'Unicorns and rainbows!',
                type: 'Überweisung')
    end

    it 'creates a document payment' do
      payment = nil
      expect do
        payment = api.create(document_payment)
      end.to change { api.find_all(document_id: 84730384).count }.by(1)
      expect(payment).to have_attributes(
        document_id: 84730384,
        amount: 3367,
        notice: 'Unicorns and rainbows!',
        type: 'Überweisung'
      )
    end
  end
end
