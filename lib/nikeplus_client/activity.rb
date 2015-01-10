module NikeplusClient
  class Activity
    include Virtus.model

    attribute :activityId, Integer
    attribute :activityType, String
    attribute :startTime, DateTime
    attribute :activityTimeZone, String
    attribute :status, String
    attribute :deviceType, String
    attribute :metricSummary, MetricSummary
    attribute :tags, Array[Tag]
  end
end

