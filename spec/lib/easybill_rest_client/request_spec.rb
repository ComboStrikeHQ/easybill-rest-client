# frozen_string_literal: true
RSpec.describe EasybillRestClient::Request do
  subject do
    described_class.new(
      api_key: 'api-key',
      method: :get,
      endpoint: '/',
      params: {},
      logger: Logger.new(nil),
      tries: 2,
      retry_cool_off_time: 0
    )
  end

  context 'too many requests have been sent' do
    let(:too_many_requests) { Net::HTTPTooManyRequests.new(nil, '429', nil) }
    let(:ok) do
      response = Net::HTTPOK.new(nil, '200', nil)
      response.body = 'BODYBODYBODY'
      response.instance_variable_set('@read', true)
      response.content_type = 'application/json'
      response
    end

    it 'retries api calls that return a "Too Many Requests" error' do
      allow(Net::HTTP).to receive(:start).and_return(too_many_requests, ok)

      expect(subject.run.body).to eq('BODYBODYBODY')
    end
  end
end
