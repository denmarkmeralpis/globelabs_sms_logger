# Module
module GlobelabsSmsLogger
  # class cofiguration
  class Configuration
    attr_writer :api_token, :app_identifier, :host

    def initialize
      @api_token = nil
      @app_identifier = nil
      @host = nil
    end

    def api_token
      unless @api_token
        raise GlobelabsSmsLogger::Error,
              'Globelabs SMS Dashboard api_token is missing!
                See documentation for configuration settings.'
      end

      @api_token
    end

    def app_identifier
      unless @app_identifier
        raise GlobelabsSmsLogger::Error,
              'Globelabs SMS Dashboard api_token is missing!
                See documentation for configuration settings.'
      end

      @app_identifier
    end

    def host
      unless @host
        raise GlobelabsSmsLogger::Error,
              'Globelabs SMS Dashboard host is missing!
                See documentation for configuration settings.'
      end

      @host
    end
  end
 end
