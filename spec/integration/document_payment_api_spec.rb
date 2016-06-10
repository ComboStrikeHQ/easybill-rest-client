RSpec.describe EasybillRestClient::DocumentPaymentApi, :vcr do
  subject do
    described_class.new(api_client)
  end

  describe '#find_all' do
    it 'returns document payments' do
      payments = subject.find_all.to_a
      expect(payments.last.id).to be_a(Fixnum)
    end
  end

  describe '#find' do
    it 'returns a document payment' do
      payment = subject.find(74692458)
      expect(payment.id).to eq(74692458)
      expect(payment.amount).to eq(3367)
      expect(payment.document_id).to eq(84730384)
      expect(payment.notice).to eq('Blah!')
      expect(payment.payment_at).to eq(Date.new(2016, 06, 10))
      expect(payment.type).to eq('Überweisung')
    end
  end

  describe '#delete' do
    it 'deletes a document payment' do
      expect(subject.find(74692458)).to be_a(EasybillRestClient::DocumentPayment)
      expect(subject.delete(74692458)).to be_nil
      expect { subject.find(74692458) }
        .to raise_error(EasybillRestClient::ApiError, 'DocumentPayment#74692458 not found.')
    end
  end
end
