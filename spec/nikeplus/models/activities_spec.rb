require 'spec_helper'

describe NikePlus::Activities do
  let(:token) { "thetoken" }

  it '#fetch_data retrieve data activities' do
    VCR.use_cassette("all_activities") do
      activities = NikePlus::Activities.new
      activities.fetch( access_token: token, count: 10000 )
      expect(activities.data).to be_kind_of(Array)
      expect(activities.data.first).to be_kind_of(NikePlus::Activity)
    end
  end
end
