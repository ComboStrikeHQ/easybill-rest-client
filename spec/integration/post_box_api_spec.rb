RSpec.describe Easybill::PostBoxApi, :vcr do
  subject do
    described_class.new(api_client)
  end

  describe '#post_boxes_get' do
    it 'returns post boxes' do
      post_boxes = subject.post_boxes_get(type: 'EMAIL')
      expect(post_boxes.items.count).to eq(1)
    end
  end
end
