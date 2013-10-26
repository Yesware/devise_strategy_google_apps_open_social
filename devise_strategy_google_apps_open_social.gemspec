# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise_strategy_google_apps_open_social/version'

Gem::Specification.new do |spec|
  spec.name          = "devise_strategy_google_apps_open_social"
  spec.version       = GoogleAppsOpenSocial::VERSION
  spec.authors       = ["Benjamin Coe"]
  spec.email         = ["bencoe@gmail.com"]
  spec.description   = %q{Adds support to devise for authenticating an OpenSocial signed request.}
  spec.summary       = %q{Adds support to devise for authenticating an OpenSocial signed request.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sinatra"
  spec.add_development_dependency "devise"
  spec.add_development_dependency "warden"
  spec.add_development_dependency "simplecov", ">= 0.7"
end
