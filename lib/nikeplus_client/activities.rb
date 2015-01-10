module NikeplusClient
  class Activities < Base
    API_URL = "https://api.nike.com/v1/me/sport/activities"

    def initialize(token)
      @token = token
    end

    def fetch(options = {})
      response = Excon.get(API_URL + "?#{build_params(options)}")
      extract_hash_from_json_response_body(response)["data"]
    end

    def build_params(options)
      URI.encode_www_form({access_token: @token}.merge(options))
    end
  end
end
