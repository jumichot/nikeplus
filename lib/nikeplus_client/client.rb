module NikeplusClient
  class Client
    def initialize(username, password)
      @username = username
      @password = password
    end

    def token
      response = request_token
      response = extract_json_from_response_body(response.data[:body])
      fail WrongCredential if response.key?('error')
      @token = response['access_token']
    end

    private

    def request_token
      Excon.post('https://developer.nike.com/services/login',
                 body: URI.encode_www_form(username: @username, password: @password),
                 headers: { 'Content-Type' => 'application/x-www-form-urlencoded' })
    end

    def extract_json_from_response_body(json)
      JSON.parse(json)
    end
  end

  class WrongCredential < Exception; end
end
