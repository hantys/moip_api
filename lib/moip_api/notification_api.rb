module Moip
  module V2
    class NotificationApi

      attr_reader :client

      def initialize(client)
        @client = client
      end

      def base_path
        "/preferences/notifications"
      end

      def show(id)
        @response = client.get("#{base_path}/#{id}")
        @response
      end
    end
  end
end
