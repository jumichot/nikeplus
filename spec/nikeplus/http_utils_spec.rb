require 'spec_helper'

describe NikePlus::HTTPUtils do
  let(:base) { NikePlus::TestClass.new() }

  module NikePlus
    class TestClass
      include HTTPUtils
      API_URL = "https://example.com?existing_params=true"
    end
  end

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

  it "#get_request" do
    stub_request(:get, "www.example.com").to_return(:body => "ok")
    response = base.get_request("http://www.example.com")
    expect(response.body).to eq "ok"
  end

  it "#build_url to add get parameters in url even if existing ones" do
    test_class = NikePlus::TestClass.new()
    expect(test_class.build_url({toto: "tata"})).to eq "https://example.com?existing_params=true&toto=tata"
  end

  it "#build_url use api_url and it can be overwritten" do
      class NikePlus::TestClass2
        include NikePlus::HTTPUtils
        API_URL = "https://example.com?existing_params=true"
        def api_url
          "http://lol.com"
        end
      end
      test = NikePlus::TestClass2.new
      expect(test.build_url).to eq "http://lol.com?"
  end
end
