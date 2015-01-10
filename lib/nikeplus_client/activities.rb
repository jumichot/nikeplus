module NikeplusClient
  class Activities < Base
    API_URL = "https://api.nike.com/v1/me/sport/activities"

    def initialize(token)
      @token = token
    end

    def fetch(options = {count:  999})
      response = get_request(API_URL + "?#{build_params(options)}")
      extract_hash_from_json_response_body(response)["data"]
    end
  end
end
