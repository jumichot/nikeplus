module NikePlus
  class GpsData
    include Virtus.model
    include HTTPUtils

    API_URL = "https://api.nike.com/v1/me/sport/activities"

    attribute :activityId, Integer
    attribute :elevationLoss, Float
    attribute :elevationGain, Float
    attribute :elevationMax, Float
    attribute :elevationMin, Float
    attribute :intervalMetric, Integer
    attribute :intervalUnit, String
    attribute :waypoints, Array[Waypoint]

    def fetch(options = {})
      response = get_request(build_url(options))
      data = extract_hash_from_json_response_body(response)
      self.attributes = data
      self
    end

    private

    def api_url
      API_URL + "/#{activityId}/gps"
    end
  end
end

