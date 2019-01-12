[![Build Status](https://travis-ci.org/denmarkmeralpis/globelabs_sms_logger.svg?branch=master)](https://travis-ci.org/denmarkmeralpis/globelabs_sms_logger)
[![Test Coverage](https://api.codeclimate.com/v1/badges/26978dbc15878f486bd6/test_coverage)](https://codeclimate.com/github/denmarkmeralpis/globelabs_sms_logger/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/26978dbc15878f486bd6/maintainability)](https://codeclimate.com/github/denmarkmeralpis/globelabs_sms_logger/maintainability)
# Globe Labs Sms Logger

It's a simple logger which consumes the Globelabs SMS Dashboard API(See Globelabs SMS Dasbhoard).

## Requirements

    Ruby 2.x.x

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'globelabs_sms_logger'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install globelabs_sms_logger

Then generate initializer:

    $ rails g globelabs_sms_logger::install initializer

then edit the file `config/initializers/globelabs_sms_logger.rb`

## Usage

Construct a `GlobelabsSms::Logger` object and use the `#send` method to send a request to Globelabs Dashboard. Example:

```ruby
require 'globelabs_sms_logger'

logger = GlobelabsSms::Logger.new
logger.send(address: '917XXXXXXX', content: 'Cheers!')

# You can also speicfy the api_token & app_identifier as args
# Example:
logger = GlobelabsSms::Logger.new(api_token: 'zxvcjeyxi1j1smplsmple', identifier: 'TST')
logger.send(address: '917XXXXXXX', content: 'Hello!')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/denmarkmeralpis/globelabs_sms_logger. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the GlobelabsSmsLogger project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/denmarkmeralpis/globelabs_sms_logger/blob/master/CODE_OF_CONDUCT.md).
