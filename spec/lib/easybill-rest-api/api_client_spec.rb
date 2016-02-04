RSpec.describe Easybill::ApiClient do
  subject do
    described_class.new(config)
  end

  let(:config) do
    Easybill::Configuration.new do |c|
      c.retry_cool_off_time = 0
    end
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
                                            :headers => { 'Foo' => 'bar' },
                                            :body => '{"foo":"bar"}',
                                            :success? => true)
    end

    it 'retries api calls that return a "Too Many Requests" error' do
      allow(subject).to receive(:build_request).and_return(request)

      expect(request).to receive(:run).and_return(too_many_requests)
      expect(request).to receive(:run).and_return(ok)

      expect(
        subject.call_api(:get, '/', { :return_type => 'Object' })
      ).to eq([{ :foo => 'bar' }, 200, { 'Foo' => 'bar' }])
    end
  end
end
