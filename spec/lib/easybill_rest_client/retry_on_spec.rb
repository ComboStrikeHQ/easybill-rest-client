# frozen_string_literal: true

RSpec.describe EasybillRestClient::RetryOn do
  subject(:retry_handler) { described_class.new(logger, 2, 0) }

  let(:logger) { instance_double(Logger) }
  let(:open_timeout) { EasybillRestClient::Request::OPEN_TIMEOUT }

  context 'timeout while opening connection' do
    it 'retries the request' do
      expect(logger).to receive(:warn)
        .with("Unable to open connection after #{open_timeout}s, retrying...")

      raise_error = true
      retry_handler.retry_on(Net::OpenTimeout) do
        if raise_error
          raise_error = false
          raise Net::OpenTimeout
        end
      end
    end
  end

  context 'too many requests' do
    it 'retries the request' do
      expect(logger).to receive(:warn).with('Too many requests!')

      raise_error = true
      retry_handler.retry_on(EasybillRestClient::TooManyRequests) do
        if raise_error
          raise_error = false
          raise EasybillRestClient::TooManyRequests
        end
      end
    end
  end
end
