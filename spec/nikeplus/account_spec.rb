require 'spec_helper'

describe NikePlus::Account do
  before(:each) do
    NikePlus.reset_config
  end

  it "delegate activities to Activities model" do
    account = nil
    VCR.use_cassette("succeed_token_retrieval") do
      account = NikePlus::Account.new("foo@bar.com", "foobar")
    end
    VCR.use_cassette("all_activities") do
      expect(account.activities.data.first).to be_kind_of NikePlus::Activity
    end

  end

  it "cache token result" do
    VCR.use_cassette("succeed_token_retrieval") do
      NikePlus::Account.new("foo@bar.com", "foobar").fetch_token
    end
    NikePlus::Account.new("foo@bar.com", "foobar").fetch_token
    expect(NikePlus.configuration).to eq( access_token: "thetoken" )
  end

  context "with right credentials" do
    it "retrieve token" do
      VCR.use_cassette("succeed_token_retrieval") do
        NikePlus::Account.new("foo@bar.com", "foobar")
        expect(NikePlus.configuration[:access_token]).to eq "thetoken"
      end
    end
  end

  context "with wrong credentials" do
    it "raise an explicit exception" do
      VCR.use_cassette("failed_token_retrieval") do
        expect{NikePlus::Account.new("wrong@bar.com", "wrong")}.to raise_error(NikePlus::WrongCredential)
      end
    end
  end
end
