module NikePlus
  class Activity
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
    attribute :tags, Array[Tag]

    def fetch(options = {})
      response = get_request(build_url(options))
      data = extract_hash_from_json_response_body(response)
      self.attributes = data
    end

    private

    def api_url
      API_URL + "/#{activityId}"
    end
  end
end

