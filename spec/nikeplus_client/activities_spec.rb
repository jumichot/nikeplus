require 'spec_helper'

describe NikeplusClient::Activities do
  let(:token) { "foobar" }

  it 'retrieve activities' do
    VCR.use_cassette("activities") do
      activities = NikeplusClient::Activities.fetch(token: token)
      expect(activities).to be_kind_of(Array)
    end
  end
end
