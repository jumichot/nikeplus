module NikePlus
  class AggregateDataSummary
    include Virtus.model

    attribute :experienceType, String
    attribute :records, Array[Hash]
  end
end

