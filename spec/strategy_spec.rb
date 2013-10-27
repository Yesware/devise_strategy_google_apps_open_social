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
          # Google's opensocial certifistub_request(:post, "www.example.com").with(:body => "abc", :headers => { 'Content-Length' => 3 })cate name.
          :xoauth_public_key => 'pub.9999999.2713152949996518384.cer'
        } )

      strategy = Devise::Strategies::GoogleAppsOpenSocial.new({})

      strategy.valid?.should be false
    end

  end

  describe 'authenticate!' do
    it "should not fail if a valid signed request is received" do
      # a captured signed-http request from Google.
      request = stub_request(
        "QUERY_STRING" => "oauth_body_hash=2jmj7l5rSw0yVb%2FvlWAYkK%2FYBwk%3D&opensocial_owner_id=117960006926679364326&opensocial_viewer_id=117960006926679364326&opensocial_app_id=109107117966654434528&opensocial_app_url=http%3A%2F%2Fevening-scrubland-7346.herokuapp.com%2Fcontextual_gadget%2Fspec.xml&xoauth_signature_publickey=pub.1210278512.2713152949996518384.cer&xoauth_public_key=pub.1210278512.2713152949996518384.cer&oauth_version=1.0&oauth_timestamp=1382907117&oauth_nonce=6282976860977374235&opensocial_container=http%3A%2F%2Fmail.google.com&oauth_consumer_key=www.google.com&oauth_signature_method=RSA-SHA1&oauth_signature=gmpNELGjDpp1%2BdMRB6CySdkDu25uE1JzhOZkoShfyF1VEgA8r0lrAC2bwABTyzh5r1VP0n17mo5yO%2FBMst%2FgpgYKu%2Fl9uXI1McU9jT3t590gJioE7hmwbdwLL0EzEWWJvZMJILTUBMb%2B3%2B2GnnBGjFBP3K3PzW0ZC5A%2BxEea%2BSI%3D",
        "REQUEST_METHOD" => "GET",
        "HTTP_HOST" => "evening-scrubland-7346.herokuapp.com",
        "PATH_INFO"=>"/public",
      )

      Devise::Strategies::GoogleAppsOpenSocial.any_instance
        .stub(:request)
        .and_return(request)

      strategy = Devise::Strategies::GoogleAppsOpenSocial.new({})
      strategy.authenticate!.should_not be :failure
    end
  end

end