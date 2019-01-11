GlobelabsSmsLogger.configure do |config|
   # Get the creds at Globelabs SMS Dashboard
   config.api_token = ENV['DASH_API_TOKEN']

   # Specify your dashboard host
   config.host = ENV['DASH_HOST']

   # Use default app identifier found in GLabs SMS Dashboard
   config.app_identifier = ENV['DASH_APP_IDENTIFIER']
 end
