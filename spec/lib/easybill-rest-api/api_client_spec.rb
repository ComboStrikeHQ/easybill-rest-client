RSpec.describe Easybill::ApiClient do
  subject do
    described_class.new(config)
  end

  let(:config) do
    c = Easybill::Configuration.new
    c.retry_cool_off_time = 0
    c
  end

  let(:request) { instance_double('Typhoeus::Request') }

  context 'too many requests have been sent' do
    let(:too_many_requests) do
      instance_double('Typhoeus::Response', :code => 429,
                                            :headers => {},
                                            :body => '',
                                            :success? => false,
                                            :status_message => 'Too Many Requests')
    end
    let(:ok) do
      instance_double('Typhoeus::Response', :code => 200,
                                            :headers => {},
                                            :body => 'DATADATADATA',
                                            :success? => true)
    end

    it 'retries api calls that return a "Too Many Requests" error' do
      allow(subject).to receive(:build_request).and_return(request)

      expect(request).to receive(:run).and_return(too_many_requests)
      expect(request).to receive(:run).and_return(ok)

      expect(subject.call_api(:get, '/')).to eq([nil, 200, {}])
    end
  end
end
