RSpec.describe Easybill::DocumentApi, :vcr do
  subject do
    described_class.new(api_client)
  end

  it '#documents_get' do
    documents = subject.documents_get(type: 'INVOICE')
    expect(documents.items.count).to eq(1)
    expect(documents.items.first.number).to eq('201610032')
  end
end
