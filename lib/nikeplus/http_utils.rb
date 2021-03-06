module NikePlus
  module HTTPUtils
    def post_request(url, body)
      Excon.post(url,
                 body: URI.encode_www_form(body),
                 headers: { 'Content-Type' => 'application/x-www-form-urlencoded' })
    end

    def get_request(url)
      Excon.get(url)
    end

    def extract_hash_from_json_response_body(response)
      JSON.parse(response.data[:body])
    end

    def build_url(options = {})
      uri = URI.parse(api_url)
      token = NikePlus.configuration[:access_token]
      options.merge!(access_token: token) if token
      uri.query = [uri.query, URI.encode_www_form(options)].compact.join('&')
      uri.to_s
    end

    def api_url
      self.class.const_get('API_URL')
    end
  end
end
