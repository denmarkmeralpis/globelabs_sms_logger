GlobelabsSmsLogger.configure do |config|
  # Get the creds at Globelabs SMS Dashboard
  config.api_token = ENV['DASH_API_TOKEN']

  # uncomment this line if you want to change your host
  # config.host = 'https://smsdash.nueca.net'

  # Use default app identifier found in GLabs SMS Dashboard
  config.app_identifier = ENV['DASH_APP_IDENTIFIER']
end
