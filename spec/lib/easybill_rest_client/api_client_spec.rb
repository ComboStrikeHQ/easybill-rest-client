# frozen_string_literal: true
RSpec.describe EasybillRestClient::ApiClient do
  subject do
    described_class.new(
      api_key: ENV['EASYBILL_API_KEY'],
      retry_cool_off_time: 0,
      logger: Logger.new(nil)
    )
  end

  context 'too many requests have been sent' do
    let(:too_many_requests) { Net::HTTPTooManyRequests.new(nil, '429', nil) }
    let(:ok) do
      response = Net::HTTPOK.new(nil, '200', nil)
      response.body = '{"foo":"bar"}'
      response.instance_variable_set('@read', true)
      response.content_type = 'application/json'
      response
    end

    it 'retries api calls that return a "Too Many Requests" error' do
      allow(Net::HTTP).to receive(:start).and_return(too_many_requests, ok)

      expect(
        subject.request(:get, '/')
      ).to eq(foo: 'bar')
    end
  end

  context 'timeout while opening connection' do
    let(:response) { double('response', body: '') }

    let(:logger) { instance_double(Logger) }

    before do
      allow(subject).to receive(:logger).and_return(logger)
      allow(logger).to receive(:formatter=)
    end

    it 'retries the request' do
      expect(subject).to receive(:perform_request).and_raise(Net::OpenTimeout)
      expect(logger).to receive(:warn)
        .with(a_string_matching('Unable to open connection after 5s, retrying...'))
      expect(subject).to receive(:perform_request).and_return(response)

      subject.request(:get, '/things')
    end
  end
end
