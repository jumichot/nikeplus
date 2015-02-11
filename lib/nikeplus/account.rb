module NikePlus
  class Account
    include HTTPUtils

    API_URL = "https://developer.nike.com/services/login"

    def initialize(username, password)
      @username = username
      @password = password
      fetch_token
    end

    def fetch_token
      return NikePlus.configuration[:access_token] if NikePlus.configuration[:access_token]
      response = extract_hash_from_json_response_body(request_token)
      check_token_validy(response)
      NikePlus.configure(access_token: response['access_token'])
    end

    def activities
      NikePlus::Activities.new().fetch()
    end

    private

    def check_token_validy(response)
      fail WrongCredential unless token_valid?(response)
    end

    def token_valid?(response)
      !response.key?('error')
    end

    def request_token
      post_request(API_URL, username: @username, password: @password)
    end
  end

  class WrongCredential < Exception; end
end
