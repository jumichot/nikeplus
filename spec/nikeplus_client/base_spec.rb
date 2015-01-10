require 'spec_helper'

describe NikeplusClient::Base do
  let(:base) { NikeplusClient::Base.new() }

  it "#post_request with excon" do
    stub_request(:post, "www.example.com")
      .with(:body => "name=hello+excon")
      .to_return(:body => "ok")

    response = base.post_request("http://www.example.com", name: "hello excon")

    expect(response.body).to eq "ok"
  end

  it "#extract_hash_from_json_response_body" do
    response = double(:data => {:body=>"{\"access_token\":\"thetoken\"}"})
    expect(base.extract_hash_from_json_response_body(response)).to eq({"access_token" => "thetoken"})
  end
end
