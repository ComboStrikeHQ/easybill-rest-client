# frozen_string_literal: true
RSpec.describe EasybillRestClient::RequestLogger do
  let(:logger) { instance_double(Logger) }

  subject do
    described_class.new(logger: logger, request_id: '123')
  end

  %i(info warn error).each do |method|
    it "logs #{method}s" do
      expect(logger).to receive(method).with('[easybill-rest-client] RequestId=123 foo')
      subject.public_send(method, 'foo')
    end
  end
end
