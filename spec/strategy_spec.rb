#encoding: UTF-8

require 'spec_helper'

describe Devise::Strategies::GoogleAppsOpenSocial do

  describe "valid?" do
    
    it "should return true if xoauth_public_key is set, and equal to Google's certificate name" do
      Devise::Strategies::GoogleAppsOpenSocial.any_instance
        .stub(:params)
        .and_return( {
          # Google's opensocial certificate name.
          :xoauth_public_key => 'pub.1210278512.2713152949996518384.cer'
        } )

      strategy = Devise::Strategies::GoogleAppsOpenSocial.new({})

      strategy.valid?.should be true
    end

    it "should return false if xoauth_public_key is not set" do
      Devise::Strategies::GoogleAppsOpenSocial.any_instance
        .stub(:params)
        .and_return( {} )

      strategy = Devise::Strategies::GoogleAppsOpenSocial.new({})

      strategy.valid?.should be false
    end

    it "should return false if xoauth_public_key is not Google's" do
      Devise::Strategies::GoogleAppsOpenSocial.any_instance
        .stub(:params)
        .and_return( {
          # Google's opensocial certificate name.
          :xoauth_public_key => 'pub.9999999.2713152949996518384.cer'
        } )

      strategy = Devise::Strategies::GoogleAppsOpenSocial.new({})

      strategy.valid?.should be false
    end

  end
end