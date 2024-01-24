module OpenMeteo
  class Client
    ##
    # The configuration for the OpenMeteo::Client.
    class Config
      attr_reader :host, :logger

      def initialize(api_key: nil, host: nil, logger: nil)
        @api_key = api_key || OpenMeteo.configuration.api_key
        @host = host || OpenMeteo.configuration.host
        @logger = logger || OpenMeteo.configuration.logger
      end

      def url
        "https://#{host}"
      end

      def api_key
        @api_key.is_a?(Proc) ? @api_key.call : @api_key
      end
    end
  end
end
