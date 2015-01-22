module NikePlus
  class AggregateData < Base
    include Virtus.model

    API_URL = "https://api.nike.com/v1/me/sport"

    attribute :experienceTypes, Array[String]
    attribute :summaries, Array[AggregateDataSummary], :default => []

    def lifetime_distance
      (summaries.last.records.select do |record|
        record["recordType"] == "LIFETIMEDISTANCE"
      end.first["recordValue"].to_f*10).round / 10.0
    end
  end
end

