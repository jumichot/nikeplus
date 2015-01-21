module NikePlus
  class Activities < Base
    include Virtus.model

    API_URL = "https://api.nike.com/v1/me/sport/activities"

    attribute :data, Array[Activity]
    attribute :paging, Hash

    private

    def fetch_default_options(options)
      #Load by default all activities (at least last 10 000)
      {count: 10000}.merge(options)
    end
  end
end
