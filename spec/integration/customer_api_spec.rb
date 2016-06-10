# frozen_string_literal: true
module EasybillRestClient
  RSpec.describe CustomerApi, :vcr do
    subject { client.customers }

    describe 'a list of customers' do
      it 'gets all customers' do
        customers = subject.find_all.to_a
        expect(customers).not_to be_empty
        customers.each do |customer|
          expect(customer).to be_a(Customer)
        end
      end

      it 'gets customers matching a filter' do
        expect(subject.find_all(number: '15408').to_a).to match_array [
          an_object_having_attributes(number: '15408')
        ]
      end
    end

    it 'creates, updates and deletes customer' do
      existing_customer = subject.find_all(number: 'TEST').first
      if existing_customer
        subject.delete(existing_customer.id)
        expect(subject.find_all(number: 'TEST').to_a).to be_empty
      end

      customer = subject.create(
        number: 'TEST',
        company_name: 'Fake',
        first_name: 'John',
        last_name: 'Doe')

      subject.update(customer.id, first_name: 'Bob')

      customer = subject.find(customer.id)
      expect(customer.first_name).to eq('Bob')

      subject.delete(customer.id)
      expect(subject.find_all(number: 'TEST').to_a).to be_empty
    end
  end
end
