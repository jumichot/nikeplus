module NikeplusClient
  class Activities < Base
    API_URL = "https://api.nike.com/v1/me/sport/activities"

    def initialize(token)
      @token = token
    end

    def fetch
      response = Excon.get(API_URL + "?access_token=#{@token}")
      extract_hash_from_json_response_body(response)["data"]
    end
  end
end
