module NikePlus
  class AggregateData
    include Virtus.model
    include HTTPUtils

    API_URL = "https://api.nike.com/v1/me/sport"

    attribute :experienceTypes, Array[String]

    def fetch(options = {})
      response = get_request(build_url(options))
      data = extract_hash_from_json_response_body(response)
      self.attributes = data
      self
    end
  end
end

