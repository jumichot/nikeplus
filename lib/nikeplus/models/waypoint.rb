module NikePlus
  class Waypoint
    include Virtus.model

    attribute :latitude, Float
    attribute :longitude, Float
    attribute :elevation, Float
  end
end
