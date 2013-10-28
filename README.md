Google Apps OpenSocial Strategy
======

Build Status: [![Build Status](https://travis-ci.org/yesware/devise_strategy_google_apps_open_social.png)](https://travis-ci.org/yesware/devise_strategy_google_apps_open_social)

Adds support to devise for authenticating an OpenSocial signed request.

Usage
-----

In your devise initializer add:

```ruby
require 'devise/strategies/google_apps_open_social'
config.warden do |manager|
	manager.default_strategies(scope: :user).unshift :google_apps_open_social
end
```

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
