require 'spec_helper'

describe NikePlus do
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
