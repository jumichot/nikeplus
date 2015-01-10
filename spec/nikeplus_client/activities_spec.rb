require 'spec_helper'

describe NikeplusClient::Activities do
  let(:token) { "foobar" }

  it 'retrieve activities' do
    VCR.use_cassette("all_activities") do
      activities = NikeplusClient::Activities.new(token)
      expect(activities.fetch).to be_kind_of(Array)
    end
  end
end
