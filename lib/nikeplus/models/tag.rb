module NikePlus
  class Tag
    include Virtus.model

    attribute :tagType, String
    attribute :tagValue, String
  end
end
