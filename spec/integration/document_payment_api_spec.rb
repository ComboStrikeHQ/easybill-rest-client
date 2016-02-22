RSpec.describe Easybill::DocumentPaymentApi, :vcr do
  subject do
    described_class.new(api_client)
  end

  let(:document_api) do
    Easybill::DocumentApi.new(api_client)
  end

  let(:document) do
    setup_finished_document(amount: 12345)
  end

  let(:other_document) do
    setup_finished_document(amount: 23456)
  end

  describe '#document_payments_get' do
    before do
      subject.document_payments_post(document_id: document.id,
                                     amount: 12345,
                                     payment_at: Time.utc(2016, 2, 22))
      subject.document_payments_post(document_id: other_document.id,
                                     amount: 23456,
                                     payment_at: Time.utc(2016, 2, 22))
    end

    it "returns a document's payments" do
      payments = subject.document_payments_get(document_id: document.id)
      expect(payments.total).to eq(1)
      expect(payments.items.first).to have_attributes(
        amount: '12345',
        document_id: document.id
      )
    end
  end

  describe '#document_payments_post' do
    it 'creates a document payment' do
      payment = subject.document_payments_post(document_id: 61145172,
                                               amount: 1,
                                               payment_at: Time.utc(2016, 1, 11, 14, 17, 31))
      expect(payment).to have_attributes(
        id: 53744398,
        document_id: 61145172,
        amount: '1',
        payment_at: '2016-01-11'
      )
    end
  end
end
