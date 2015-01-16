require 'excon'
require 'json'
require 'virtus'

require 'nikeplus/http_utils'
require 'nikeplus/version'
require 'nikeplus/account'
require 'nikeplus/models/metric_summary'
require 'nikeplus/models/metric'
require 'nikeplus/models/tag'
require 'nikeplus/models/waypoint'
require 'nikeplus/models/gps_data'
require 'nikeplus/models/activity'
require 'nikeplus/activities'
require 'nikeplus/models/aggregate_data_summary'
require 'nikeplus/models/aggregate_data'

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
