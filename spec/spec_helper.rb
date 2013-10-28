require 'oauth'
require 'simplecov'
require 'active_hash'
require 'action_dispatch'
require 'oauth/request_proxy/rack_request'

# Returns a stubbed out ActionDispatch::Request
# useful for simulating requests made to rails.
# see: https://github.com/rails/rails/blob/master/actionpack/test/dispatch/request_test.rb
def stub_request(env = {})
  ip_app = ActionDispatch::RemoteIp.new(Proc.new {}, false, nil)
  tld_length = 1
  ip_app.call(env)
  ActionDispatch::Http::URL.tld_length = tld_length
  ActionDispatch::Request.new(env)
end

SimpleCov.start do
  add_filter "/spec/"
end

SimpleCov.minimum_coverage 95

require_relative '../lib/devise/strategies/google_apps_open_social'
