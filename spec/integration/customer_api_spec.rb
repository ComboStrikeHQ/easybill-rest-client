# frozen_string_literal: true
module EasybillRestClient
  RSpec.describe CustomerApi, :vcr do
    let(:client) { Client.new(ENV['EASYBILL_API_KEY']) }
    let(:api) { client.customers }

    describe 'a list of customers' do
      it 'gets all customers' do
        customers = api.find_all.to_a
        expect(customers).not_to be_empty
        customers.each do |customer|
          expect(customer).to be_a(Customer)
        end
      end

      it 'gets customers matching a filter' do
        expect(api.find_all(number: '15408').to_a).to match_array [
          an_object_having_attributes(number: '15408')
        ]
      end
    end

    it 'creates, updates and deletes customer' do
      if existing_customer = api.find_all(number: 'TEST').first
        api.delete(existing_customer.id)
        expect(api.find_all(number: 'TEST').to_a).to be_empty
      end

      customer = api.create(
        number: 'TEST',
        company_name: 'Fake',
        first_name: 'John',
        last_name: 'Doe')

      api.update(customer.id, first_name: 'Bob')

      customer = api.find(customer.id)
      expect(customer.first_name).to eq('Bob')

      api.delete(customer.id)
      expect(api.find_all(number: 'TEST').to_a).to be_empty
    end
  end
end
