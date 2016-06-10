# frozen_string_literal: true
RSpec.describe EasybillRestClient::ApiClient do
  subject do
    described_class.new(api_key: ENV['EASYBILL_API_KEY'], retry_cool_off_time: 0)
  end

  let(:faraday) { instance_double(Faraday::Connection) }

  before do
    allow(Faraday).to receive(:new).with(url: 'https://api.easybill.de/rest/v1')
      .and_return(faraday)
  end

  context 'too many requests have been sent' do
    let(:too_many_requests) do
      double('response', status: 429, headers: {}, body: '')
    end
    let(:ok) do
      double('response', status: 200,
                         headers: { 'content-type' => 'application/json' },
                         body: '{"foo":"bar"}')
    end

    it 'retries api calls that return a "Too Many Requests" error' do
      expect(faraday).to receive(:get).and_return(too_many_requests)
      expect(faraday).to receive(:get).and_return(ok)

      expect(
        subject.request(:get, '/')
      ).to eq(foo: 'bar')
    end
  end
end
