RSpec.describe Easybill::CustomerApi, :vcr do
  subject do
    described_class.new(api_client)
  end

  describe '#customers_get' do
    it 'returns customers' do
      customers = subject.customers_get
      expect(customers.items).to be_any
    end
  end

  describe '#customers_post' do
    it 'creates a customer' do
      customer = subject.customers_post({ company_name: 'ACME Inc.', last_name: 'Smith' })
      expect(customer.id).to eq(51374354)
    end
  end
end
