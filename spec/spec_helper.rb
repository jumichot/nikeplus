require 'coveralls'
Coveralls.wear!

require 'nikeplus_client'
require 'vcr'
require 'webmock'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end
