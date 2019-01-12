require_relative '../spec_helper'

RSpec.describe GlobelabsSmsLogger::Configuration do
  before do
    GlobelabsSmsLogger.configure do |config|
      config.host = ENV['DASH_HOST']
      config.api_token = ENV['DASH_API_TOKEN']
      config.app_identifier = ENV['DASH_APP_IDENTIFIER']
    end
  end

  context 'with configuration block' do
    it 'returns correct api_token' do
      expect(GlobelabsSmsLogger.configuration.api_token)
        .to eq(ENV['DASH_API_TOKEN'])
    end

    it 'returns correct host' do
      expect(GlobelabsSmsLogger.configuration.host)
        .to eq(ENV['DASH_HOST'])

      expect(GlobelabsSmsLogger.configuration.host)
        .not_to eq('https://smsdash.nueca.net')
    end

    it 'returns correct identifier' do
      expect(GlobelabsSmsLogger.configuration.app_identifier)
        .to eq(ENV['DASH_APP_IDENTIFIER'])
    end
  end

  context 'without configuration block' do
    before { GlobelabsSmsLogger.reset }

    it 'raises error for api_token' do
      expect { GlobelabsSmsLogger.configuration.api_token }
        .to raise_error(GlobelabsSmsLogger::Error)
    end

    it 'returns default host' do
      expect(GlobelabsSmsLogger.configuration.host)
        .to eq('https://smsdash.nueca.net')
    end

    it 'raises error for app_identifier' do
      expect { GlobelabsSmsLogger.configuration.app_identifier }
        .to raise_error(GlobelabsSmsLogger::Error)
    end
  end

  context '#reset' do
    it 'resets configurations' do
      GlobelabsSmsLogger.reset
      expect { GlobelabsSmsLogger.configuration.api_token }
        .to raise_error(GlobelabsSmsLogger::Error)
      expect { GlobelabsSmsLogger.configuration.app_identifier }
        .to raise_error(GlobelabsSmsLogger::Error)
      expect(GlobelabsSmsLogger.configuration.host)
        .to eq('https://smsdash.nueca.net')
    end
  end
end
