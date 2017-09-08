module Moip
  module V2
    class RefundApi

      attr_reader :client

      def initialize(client)
        @client = client
      end

      def base_path(order_id)
        "/orders/#{order_id}/refunds"
      end

      def full(order_id)
        @response = client.post(base_path(order_id))
      end

      def partial(order_id, value)
        @response = client.post(base_path(order_id), amount: value)
      end
    end
  end
end
