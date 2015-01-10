module NikeplusClient
  class Activities
    API_URL = "https://api.nike.com/v1/me/sport/activities"

    def self.fetch(token)
      response = Excon.get(API_URL + "?access_token=OwTyiRUlhaNVIP8AKVfYrUA9a1wl")
      data = JSON.parse(response.data[:body])
      data["data"]
    end
  end
end
