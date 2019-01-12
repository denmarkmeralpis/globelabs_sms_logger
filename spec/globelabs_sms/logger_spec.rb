require_relative '../spec_helper'
require 'webmock/rspec'
require 'base64'

RSpec.describe GlobelabsSms::Logger do
  let(:content) { 'Hello World' }
  let(:address) { '9177710296' }
  let(:logger) { GlobelabsSms::Logger.new }
  let(:host) { ENV['DASH_HOST'] + '/api/v1/messages' }
  let(:headers) do
    { 'Authorization': 'Basic ' + Base64.encode64(
      ENV['DASH_APP_IDENTIFIER'] + ':' + ENV['DASH_API_TOKEN']
    ).chomp }
  end

  before do
    GlobelabsSmsLogger.configure do |config|
      config.host = ENV['DASH_HOST']
      config.api_token = ENV['DASH_API_TOKEN']
      config.app_identifier = ENV['DASH_APP_IDENTIFIER']
    end
  end

  describe '#send' do
    let(:response) { logger.send(address: address, content: content) }

    context 'with correct data' do
      it 'returns 200' do
        stub_request(:post, host)
          .to_return(body: response_body('success.json'),
                     status: 200, headers: headers)
        expect(response).to have_key(:code)
        expect(response).to have_key(:body)
        expect(response[:code]).to eq('200')
      end
    end

    context 'with unauthorized data' do
      it 'returns 401' do
        stub_request(:post, host).to_return(status: 401)
        expect(response).to have_key(:code)
        expect(response).to have_key(:body)
        expect(response[:code]).to eq('401')
      end
    end

    context 'Overriding of values' do
      let(:logger) do
        GlobelabsSms::Logger.new(
          address: 'XXXXXXXXXXX',
          content: 'XXXXX',
          group: 'groupX')
      end

      it 'returns init values' do
        expect(logger.address).to eq('XXXXXXXXXXX')
        expect(logger.content).to eq('XXXXX')
        expect(logger.group).to eq('groupX')
      end

      it 'overrides values thru #send options' do
        stub_request(:post, host)
            .to_return(body: response_body('success.json'),
                      status: 200, headers: headers)
        logger.send(address: 'YYYYYYYYYY', content: 'YYYY', group: 'groupY')

        expect(logger.address).to eq('YYYYYYYYYY')
        expect(logger.content).to eq('YYYY')
        expect(logger.group).to eq('groupY')
      end
    end
  end

  def response_body(filename)
    File.read(File.expand_path('../../fixtures/' + filename, __FILE__))
  end
end
