module NikeplusClient
  class Activities
    include HTTPUtils
    API_URL = "https://api.nike.com/v1/me/sport/activities"

    def fetch(options = {})
      options = load_default_option(options)
      response = get_request(build_url(options))
      data = extract_hash_from_json_response_body(response)["data"]
      data.map do |activity|
        Activity.new(activity)
      end
    end

    private

    def load_default_option(options)
      #Load by default all activities (at least last 10 000)
      {count: 10000}.merge(options)
    end
  end
end
