module NikePlus
  class Metric
    include Virtus.model

    attribute :intervalMetric, String
    attribute :intervalUnit, String
    attribute :metricType, String
    attribute :values, Array[String]
  end
end
