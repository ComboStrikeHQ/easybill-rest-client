# frozen_string_literal: true
RSpec.describe EasybillRestClient::PostBoxApi, :vcr do
  subject do
    client.post_boxes
  end

  describe '#find_all' do
    it 'returns post boxes' do
      post_boxes = subject.find_all(type: 'EMAIL').to_a
      expect(post_boxes.count).to eq(1)
      expect(post_boxes.first).to be_a(EasybillRestClient::PostBox)
      expect(post_boxes.first.id).to be_a(Fixnum)
    end
  end

  describe '#find' do
    it 'returns a post box' do
      post_box = subject.find(58942178)
      expect(post_box).to be_a(EasybillRestClient::PostBox)
      expect(post_box.id).to be_a(Fixnum)
    end
  end

  describe '#delete' do
    it 'deletes a post box' do
      subject.find(58942178)
      subject.delete(58942178)
      expect { subject.find(58942178) }
        .to raise_error(EasybillRestClient::ApiError, 'PostBox#58942178 not found.')
    end
  end
end
