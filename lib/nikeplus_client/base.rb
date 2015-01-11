module NikeplusClient
  class Base
    def post_request(url, body)
      Excon.post(url,
                 body: URI.encode_www_form(body),
                 headers: { 'Content-Type' => 'application/x-www-form-urlencoded' })
    end

    def get_request(url)
      Excon.get(url)
    end

    def encode_params(options)
      URI.encode_www_form(options)
    end

    def extract_hash_from_json_response_body(response)
      JSON.parse(response.data[:body])
    end

    def build_url(options = {})
      uri = URI.parse(self.class.const_get('API_URL'))
      uri.query = [uri.query, encode_params(options)].compact.join('&')
      uri.to_s
    end
  end
end
