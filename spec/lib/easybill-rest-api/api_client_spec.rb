RSpec.describe Easybill::ApiClient do
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

    let(:request) { instance_double('Typhoeus::Request') }

    it 'retries api calls that return a "Too Many Requests" error' do
      allow(Retryable).to receive(:retryable).and_wrap_original do |m, opts, &block|
        m.call(opts.merge(:sleep => 0), &block)
      end

      allow(subject).to receive(:build_request).and_return(request)

      expect(request).to receive(:run).and_return(too_many_requests)
      expect(request).to receive(:run).and_return(ok)

      expect(subject.call_api(:get, '/')).to eq([nil, 200, {}])
    end
  end
end
