RSpec.describe Easybill::CustomerApi, :vcr do
  subject do
    described_class.new(api_client)
  end

  describe '#customers_get' do
    it 'returns customers' do
      customers = subject.customers_get
      expect(customers.items).to be_any
    end

    it 'returns customers by number' do
      customers = subject.customers_get(number: 154085)
      expect(customers.items.count).to eq(1)
      expect(customers.items.first.number).to eq('154085')
    end
  end

  describe '#customers_id_get' do
    it 'returns a customer by id' do
      customer = subject.customers_id_get(51374354)
      expect(customer.id).to eq(51374354)
    end
  end

  describe '#customers_post' do
    it 'creates a customer' do
      customer = subject.customers_post({ company_name: 'ACME Inc.', last_name: 'Smith' })
      expect(customer.id).to eq(51374354)
    end
  end

  describe '#customers_id_put' do
    it 'updates a customer' do
      subject.customers_id_put(16314756, emails: ['user@example.com'])
      expect(subject.customers_id_get(16314756).emails).to eq(['user@example.com'])
    end
  end

  describe '#customers_id_delete' do
    it 'deletes a customer' do
      expect(subject.customers_id_get(16314756)).to_not be(nil)
      subject.customers_id_delete(16314756)
      expect do
        expect(subject.customers_id_get(16314756)).to be(nil)
      end.to raise_error(Easybill::ApiError, 'Not Found')
    end
  end
end
