# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "easybill-rest-client/version"

Gem::Specification.new do |s|
  s.name        = "easybill-rest-client"
  s.version     = EasybillRestClient::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Zeke Sikelianos", "Tony Tam"]
  s.email       = ["zeke@wordnik.com", "fehguy@gmail.com"]
  s.homepage    = "http://swagger.io"
  s.summary     = %q{A ruby wrapper for the swagger APIs}
  s.description = %q{This gem maps to a swagger API}
  s.license     = "Apache-2.0"

  s.add_runtime_dependency 'faraday', '~> 0.9'
  s.add_runtime_dependency 'virtus', '~> 1.0'
  s.add_runtime_dependency 'retryable', '~> 2.0'

  s.add_development_dependency 'rspec', '~> 3.4'
  s.add_development_dependency 'vcr', '~> 3.0'
  s.add_development_dependency 'webmock', '~> 2.1'
  s.add_development_dependency 'pry'

  s.files         = `find *`.split("\n").uniq.sort.select{|f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
