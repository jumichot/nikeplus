require 'spec_helper'

describe NikePlus do
  it "can initialize an account" do
    account = NikePlus.new("ju@test.com","123456")
    expect(account).to be_kind_of(NikePlus::Account)
  end

  describe "NikePlus configuration" do
    it "#configure saves options" do
      NikePlus.configure(access_token: "thetoken")
      expect(NikePlus.configuration).to eq({access_token: "thetoken"})
    end

    it "can reset option" do
      NikePlus.configure(access_token: "thetoken")
      NikePlus.reset_config
      expect(NikePlus.configuration).to eq({})
    end
  end
end
