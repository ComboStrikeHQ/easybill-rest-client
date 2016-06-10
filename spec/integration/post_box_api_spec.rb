RSpec.describe EasybillRestClient::PostBoxApi, :vcr do
  subject do
    described_class.new(api_client)
  end

  describe '#find_all' do
    it 'returns post boxes' do
      post_boxes = subject.find_all(type: 'EMAIL').to_a
      expect(post_boxes.count).to eq(1)
      expect(post_boxes.first).to be_a(EasybillRestClient::PostBox)
      expect(post_boxes.first.id).to be_a(Fixnum)
    end
  end
end
