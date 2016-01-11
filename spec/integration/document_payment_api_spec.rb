RSpec.describe Easybill::DocumentPaymentApi, :vcr do
  subject do
    described_class.new(api_client)
  end

  describe '#document_payments_get' do
    it "returns a document's payments" do
      payments = subject.document_payments_get(document_id: 61145172)
      expect(payments.items.first).to have_attributes(
        amount: '1',
        id: 53744398
      )
    end
  end

  describe '#document_payments_post' do
    it 'creates a document payment' do
      payment = subject.document_payments_post(document_id: 61145172,
                                               amount: 1,
                                               payment_at: Time.new(2016, 1, 11, 14, 17, 31))
      expect(payment).to have_attributes(
        id: 53744398,
        document_id: 61145172,
        amount: '1',
        payment_at: '2016-01-11'
      )
    end
  end
end
