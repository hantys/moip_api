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

      def list
        @response = client.list("#{base_path}")
      end

      def create(notification)
        @response = client.post("#{base_path}", notification)
      end
    end
  end
end
