module NikeplusClient
  class Activities < Base
    API_URL = "https://api.nike.com/v1/me/sport/activities"

    def initialize(token)
      @token = token
    end

    def fetch(options = {count:  999})
      response = get_request(build_url(options))
      data = extract_hash_from_json_response_body(response)["data"]
      data.map do |activity|
        Activity.new(activity)
      end
    end

    private

    def build_url(options = {})
      uri = URI.parse(API_URL)
      uri.query = [uri.query, build_params(options)].compact.join('&') 
      uri.to_s
    end
  end
end
