module NikePlus
  class Activity < Base
    include Virtus.model
    include HTTPUtils

    API_URL = "https://api.nike.com/v1/me/sport/activities"

    attribute :activityId, Integer
    attribute :activityType, String
    attribute :startTime, DateTime
    attribute :activityTimeZone, String
    attribute :status, String
    attribute :deviceType, String
    attribute :metricSummary, MetricSummary
    attribute :metrics, Array[Metric]
    attribute :tags, Array[Tag]
    attribute :isGpsActivity, Boolean

    def gps_data(options = {})
      GpsData.new(activityId: activityId).fetch(options)
    end

    private

    def api_url
      API_URL + "/#{activityId}"
    end
  end
end

