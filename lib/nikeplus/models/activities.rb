module NikePlus
  class Activities < Base
    include Virtus.model
    include HTTPUtils

    API_URL = "https://api.nike.com/v1/me/sport/activities"

    attribute :data, Array[Activity]
    attribute :paging, Hash

    def fetch_data(options = {})
      options = fetch_default_options(options)
      response = get_request(build_url(options))
      data = extract_hash_from_json_response_body(response)
      self.attributes = data
      self
    end

    private

    def fetch_default_options(options)
      #Load by default all activities (at least last 10 000)
      {count: 10000}.merge(options)
    end
  end
end
