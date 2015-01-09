require 'nikeplus_client/version'
require 'excon'
require 'json'

module NikeplusClient
  def self.get_token
    response = request_token
    extract_token_from_json_response(response.data[:body])
  end

  def self.request_token
      Excon.post('https://developer.nike.com/services/login',
      :body => URI.encode_www_form(:username => 'ju.michot@gmail.com', :password => 'Ek]@nsR6u!nD2nG}:t~_'),
      :headers => { "Content-Type" => "application/x-www-form-urlencoded" })
  end

  def self.extract_token_from_json_response(json)
    JSON.parse(json)["access_token"]
  end
end
