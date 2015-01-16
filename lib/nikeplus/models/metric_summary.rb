module NikePlus
  class MetricSummary
    include Virtus.model

    attribute :calories, Integer
    attribute :fuel, Integer
    attribute :distance, Float
    attribute :steps, Integer
    attribute :duration, String
  end
end
