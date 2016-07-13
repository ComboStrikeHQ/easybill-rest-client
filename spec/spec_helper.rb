# frozen_string_literal: true
require 'pry'
require 'vcr'
Dir[File.expand_path('../support/*.rb', __FILE__)].each { |rb| require rb }
require 'easybill_rest_client'
require 'webmock/rspec'

RSpec.configure do |config|
  config.include SetupClient

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

VCR.configure do |c|
  c.default_cassette_options = { match_requests_on: %i(method uri body) }
  c.configure_rspec_metadata!
  c.cassette_library_dir = 'spec/fixtures/vcr'
  c.hook_into :webmock
  c.filter_sensitive_data('easybill-username') { ENV.fetch('EASYBILL_USERNAME') }
  c.filter_sensitive_data('easybill-api-key') { ENV.fetch('EASYBILL_API_KEY') }
  c.filter_sensitive_data('easybill-basic-auth-key') { ENV.fetch('EASYBILL_BASIC_AUTH_KEY') }
end

ENV['EASYBILL_USERNAME'] ||= 'easybill-username'
ENV['EASYBILL_API_KEY'] ||= 'easybill-api-key'
ENV['EASYBILL_BASIC_AUTH_KEY'] ||= 'easybill-basic-auth-key'
