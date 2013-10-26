#encoding: UTF-8

require 'spec_helper'

describe Devise::Strategies::GoogleAppsOpenSocial do
  describe "valid?" do
    it "should be valid" do
      strategy = Devise::Strategies::GoogleAppsOpenSocial.new({}, {})
      true.should be true
    end
  end
end