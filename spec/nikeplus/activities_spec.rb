require 'spec_helper'

describe NikePlus::Activities do
  let(:token) { "foobar" }

  it '#fetch_data retrieve data activities' do
    VCR.use_cassette("all_activities") do
      NikePlus::Activities.new().fetch_data({access_token: token, count: 999}) do |activities|
        expect(activities).to be_kind_of(Array)
      end
    end
  end

  it "" do
    VCR.use_cassette("all_activities") do
      NikePlus::Activities.new().activities({access_token: token, count: 999}) do |activities|
        expect(activities.first).to be_kind_of(NikePlus::Activity)
      end
    end
  end
end
