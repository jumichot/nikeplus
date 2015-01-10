require 'spec_helper'

describe NikeplusClient::Account do
  context "with right credentials" do
    it "retrieve token" do
      VCR.use_cassette("succeed_token_retrieval") do
        account = NikeplusClient::Account.new("foo@bar.com", "foobar")
        expect(account.token()).to eq "thetoken"
      end
    end
  end

  context "with wrong credentials" do
    it "raise an explicit exception" do
      VCR.use_cassette("failed_token_retrieval") do
        account = NikeplusClient::Account.new("wrong@bar.com", "wrong")
        expect{account.token()}.to raise_error(NikeplusClient::WrongCredential)
      end
    end
  end
end
