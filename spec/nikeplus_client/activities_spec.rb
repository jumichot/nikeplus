require 'spec_helper'

describe NikeplusClient::Activities do
  let(:token) { "foobar" }

  it 'retrieve activities' do
    VCR.use_cassette("all_activities") do
      activities = NikeplusClient::Activities.new().fetch({access_token: token, count: 999})
      expect(activities).to be_kind_of(Array)
      expect(activities.first).to be_kind_of(NikeplusClient::Activity)
    end
  end
end
