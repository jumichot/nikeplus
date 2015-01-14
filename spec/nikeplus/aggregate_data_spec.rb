require 'spec_helper'

describe NikePlus::Activity do
  let(:token) { "foobar" }

  describe "#fetch" do
    it "#fetch return a new Activity" do
      VCR.use_cassette("aggregate_data") do
        activity = NikePlus::AggregateData.new()
        activity.fetch(access_token: token)
        expect(activity.experienceTypes).to eq ["FUELBAND", "RUNNING"]
      end
    end
    it "#summaries has Array of AggregateDataSummary" do
      VCR.use_cassette("aggregate_data") do
        activity = NikePlus::AggregateData.new()
        activity.fetch(access_token: token)
        expect(activity.summaries.first).to be_kind_of(NikePlus::AggregateDataSummary)
        expect(activity.summaries.first.experienceType).to eq "ALL"
      end
    end
  end
end
