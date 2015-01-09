require 'spec_helper'

describe NikeplusClient::Client do
  context "with right credentials" do
    it "retrieve token" do
      VCR.use_cassette("succeed_token_retrieval") do
        nike_client = NikeplusClient::Client.new("foo@bar.com", "foobar")
        expect(nike_client.token()).to eq "thetoken"
      end
    end
  end

  context "with wrong credentials" do
    it "raise an explicit exception" do
      VCR.use_cassette("failed_token_retrieval") do
        nike_client = NikeplusClient::Client.new("wrong@bar.com", "wrong")
        expect{nike_client.token()}.to raise_error(NikeplusClient::WrongCredential)
      end
    end
  end
end
