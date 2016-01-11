RSpec.describe Easybill::DocumentPaymentApi, :vcr do
  subject do
    described_class.new(api_client)
  end

  let(:attributes) do
    {
      document_id: 61145172,
      amount: 1,
      payment_at: Time.new(2016, 1, 11, 14, 17, 31)
    }
  end

  describe '#document_payments_post' do
    it 'creates a document payment' do
      payment = subject.document_payments_post(document_id: 61145172,
                                               amount: 1,
                                               payment_at: Time.new(2016, 1, 11, 14, 17, 31))
      expect(payment).to have_attributes(
        document_id: 61145172,
        amount: '1',
        payment_at: '2016-01-11'
      )
    end
  end
end
