require 'spec_helper'

describe NikePlus::Account do
  before(:each) do
   NikePlus.reset_config
  end

  context "with right credentials" do
    it "retrieve token" do
      VCR.use_cassette("succeed_token_retrieval") do
        account = NikePlus::Account.new("foo@bar.com", "foobar")
        expect(account.token).to eq "thetoken"
      end
    end
  end

  context "with wrong credentials" do
    it "raise an explicit exception" do
   NikePlus.reset_config
      VCR.use_cassette("failed_token_retrieval") do
        account = NikePlus::Account.new("wrong@bar.com", "wrong")
        expect{account.token}.to raise_error(NikePlus::WrongCredential)
      end
    end
  end

  it "cache token result" do
      VCR.use_cassette("succeed_token_retrieval") do
        NikePlus::Account.new("foo@bar.com", "foobar").token
      end
      # do not raise vcr unexpected request error message
      NikePlus::Account.new("foo@bar.com", "foobar").token
      expect(NikePlus.configuration).to eq({:access_token=>"thetoken"})
  end
end
