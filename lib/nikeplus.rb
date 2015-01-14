require 'excon'
require 'json'
require 'virtus'

require 'nikeplus/http_utils'
require 'nikeplus/version'
require 'nikeplus/account'
require 'nikeplus/metric_summary'
require 'nikeplus/metric'
require 'nikeplus/tag'
require 'nikeplus/waypoint'
require 'nikeplus/gps_data'
require 'nikeplus/activity'
require 'nikeplus/activities'
require 'nikeplus/aggregate_data_summary'
require 'nikeplus/aggregate_data'

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
