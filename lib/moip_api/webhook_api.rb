module Moip
  module V2
    class WebhookApi

      attr_reader :client

      def initialize(client)
        @client = client
      end

      def base_path
        "/webhooks"
      end

      def list
        @response = client.list("#{base_path}")
        @response
      end

    end

  end
end
