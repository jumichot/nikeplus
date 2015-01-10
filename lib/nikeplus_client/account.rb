module NikeplusClient
  class Account < Base
    def initialize(username, password)
      @username = username
      @password = password
    end

    def token
      return @access_token if @access_token
      response = extract_hash_from_json_response_body(request_token)
      fail WrongCredential if response.key?('error')
      @access_token = response['access_token']
    end

    private

    def request_token
      post_request('https://developer.nike.com/services/login', username: @username, password: @password)
    end
  end

  class WrongCredential < Exception; end
end
