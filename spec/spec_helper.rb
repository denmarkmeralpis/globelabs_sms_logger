require 'bundler/setup'
require 'globelabs_sms_logger'
require 'byebug'
require 'simplecov'
require 'simplecov-console'
require 'dotenv'

# SimpleCov.formatter = SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start

Dotenv.load

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    GlobelabsSmsLogger.configure do |qiksms_config|
      qiksms_config.api_token = ENV['DASH_API_TOKEN']
      qiksms_config.app_identifier = ENV['DASH_APP_IDENTIFIER']
      qiksms_config.host = ENV['DASH_HOST']
    end
  end
end
