require 'excon'
require 'json'
require 'virtus'

require 'nikeplus/http_utils'
require 'nikeplus/version'
require 'nikeplus/account'
require 'nikeplus/metric_summary'
require 'nikeplus/tag'
require 'nikeplus/activity'
require 'nikeplus/activities'

module NikePlus
  @@config = {}

  def self.configure(options={})
    @@config[:access_token] = options[:access_token] if options[:access_token]
  end

  def self.configuration
    @@config
  end

  def self.reset_config
    @@config = {}
  end
end
