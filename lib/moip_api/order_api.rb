module Moip
  module V2
    class OrderApi

      attr_reader :client

      def initialize(client)
        @client = client
      end

      def base_path
        "/orders"
      end

      def create(order)
        @response = client.post(base_path, order)
        @response
      end

      def show(id)
        @response = client.get("#{base_path}/#{id}")
        @response
      end

      def list
        @response = client.list("#{base_path}")
      end

    end

  end
end
