# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "devise_strategy_google_apps_open_social"
  spec.version       = '1.0.0'
  spec.authors       = ["apps@yesware.com"]
  spec.email         = ["info@yesware.com"]
  spec.description   = %q{Adds support to devise for authenticating an OpenSocial signed request.}
  spec.summary       = %q{Adds support to devise for authenticating an OpenSocial signed request.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "oauth"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "devise"
  spec.add_development_dependency "warden"
  spec.add_development_dependency "rails"
  spec.add_development_dependency "timecop"
  spec.add_development_dependency "active_hash"
  spec.add_development_dependency "simplecov", ">= 0.7"
end
