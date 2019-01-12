require 'net/http'
require 'json'

# Module
class GlobelabsSms
  # Class
  class Logger
    attr_accessor :api_token, :identifier, :host, :address, :content, :group

    ENDPOINT = '/api/v1/messages'.freeze

    def initialize(opts = {})
      @address = opts[:address]
      @content = opts[:content]
      @group   = opts[:group]
      @host = GlobelabsSmsLogger.configuration.host
      @api_token = opts.fetch(:api_token,
                              GlobelabsSmsLogger.configuration.api_token)
      @identifier = opts.fetch(:identifier,
                               GlobelabsSmsLogger.configuration.app_identifier)
    end

    def send(opts = {})
      @address = opts.fetch(:address, address)
      @content = opts.fetch(:content, content)
      @group   = opts.fetch(:group, group)

      perform_sending
    end

    private

    def perform_sending
      uri = URI(host + ENDPOINT)
      req = Net::HTTP::Post.new(uri.path)
      req['Gem-Version'] = GlobelabsSmsLogger::VERSION
      req.basic_auth(identifier, api_token)
      req.set_form_data(content: content, address: address, group: group)
      res = Net::HTTP.start(uri.host, uri.port,
                            use_ssl: uri.scheme == 'https') do |http|
        http.request(req)
      end

      { code: res.code, body: res.body }
    end
  end
end
