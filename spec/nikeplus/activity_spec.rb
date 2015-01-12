require 'spec_helper'

describe NikePlus::Activity do
  let(:token) { "foobar" }

  describe "#fetch" do
    it "#fetch return a new Activity" do
      VCR.use_cassette("go_activity") do
        activity = NikePlus::Activity.new(activityId: "3198000000011524937810007382618856401351")
        activity.fetch_details(access_token: "foobar")
        expect(activity).to be_kind_of(NikePlus::Activity)
        expect(activity.activityType).to eq "RUN"
      end
    end
  end
end
