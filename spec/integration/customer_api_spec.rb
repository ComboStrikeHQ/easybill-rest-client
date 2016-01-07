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
end
