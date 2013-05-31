# encoding: UTF-8
require 'cgi'
VCR.config do |config|
  config.cassette_library_dir = File.expand_path('../../fixtures/net', __FILE__)
  config.default_cassette_options = { :record => :none }
  config.stub_with :webmock
  config.filter_sensitive_data('%{API_USERNAME}') { CGI::escape(AVALARA_CONFIGURATION['username']) } # handle name@example.com
  config.filter_sensitive_data('%{API_PASSWORD}') { CGI::escape(AVALARA_CONFIGURATION['password']) }
  config.filter_sensitive_data('%{API_ENDPOINT}') { AVALARA_CONFIGURATION['endpoint'] }
end

RSpec.configure do |config|
  config.extend(VCR::RSpec::Macros)
end