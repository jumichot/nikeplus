module NikePlus
  class AggregateData
    include Virtus.model
    include HTTPUtils

    API_URL = "https://api.nike.com/v1/me/sport"

    attribute :experienceTypes, Array[String]
    attribute :summaries, Array[AggregateDataSummary]

    def fetch(options = {})
      response = get_request(build_url(options))
      data = extract_hash_from_json_response_body(response)
      self.attributes = data
      self
    end

    def lifetime_distance
      (summaries.last.records.select do |record|
        record["recordType"] == "LIFETIMEDISTANCE"
      end.first["recordValue"].to_f*10).round / 10.0
    end
  end
end

