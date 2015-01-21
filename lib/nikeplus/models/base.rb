module NikePlus
  class Base
    include HTTPUtils

    def fetch(options = {})
      options = fetch_default_options(options)
      response = get_request(build_url(options))
      data = extract_hash_from_json_response_body(response)
      self.attributes = data
      self
    end

    def fetch_default_options(options)
      options
    end
  end
end
