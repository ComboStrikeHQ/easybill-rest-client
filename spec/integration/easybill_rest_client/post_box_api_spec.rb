# frozen_string_literal: true

RSpec.describe EasybillRestClient::PostBoxApi, :vcr do
  subject(:api) { client.post_boxes }

  describe '#find_all' do
    it 'returns post boxes' do
      post_boxes = api.find_all(type: 'EMAIL').to_a
      expect(post_boxes.count).to eq(1)
      expect(post_boxes.first).to be_a(EasybillRestClient::PostBox)
      expect(post_boxes.first.id).to be_a(Integer)
    end
  end

  describe '#find' do
    it 'returns a post box' do
      post_box = api.find(58942178)
      expect(post_box).to be_a(EasybillRestClient::PostBox)
      expect(post_box.id).to be_a(Integer)
    end
  end

  describe '#delete' do
    it 'deletes a post box' do
      api.find(58942178)
      api.delete(58942178)
      expect { api.find(58942178) }
        .to raise_error(EasybillRestClient::ApiError, /PostBox#58942178 not found./)
    end
  end
end
