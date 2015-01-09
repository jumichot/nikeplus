require 'spec_helper'

describe NikeplusClient do
  it "retrieve token" do
    VCR.use_cassette("token_retrieval") do
      expect(NikeplusClient.get_token()).to eq "thetoken"
    end
  end
end
