require 'simplecov'

SimpleCov.start do
  add_filter "/spec/"
end

SimpleCov.minimum_coverage 95

require_relative '../lib/google_apps_open_social'
