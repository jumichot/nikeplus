module NikePlus
  class AggregateData < Base
    API_URL = "https://api.nike.com/v1/me/sport"

    attribute :experienceTypes, Array[String]
    attribute :summaries, Array[AggregateDataSummary], :default => []

    def lifetime_distance
      distance = Array(summaries.last.records.select do |record|
        record["recordType"] == "LIFETIMEDISTANCE"
      end)
      (distance.first["recordValue"].to_f*10).round / 10.0 if distance
    end
  end
end

