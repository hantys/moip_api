module Moip
  module V2
    class PaymentApi

      attr_reader :client

      def initialize(client)
        @client = client
      end

      def create(order_id, payment)
        @response= client.post("/v2/orders/#{order_id}/payments", payment)
        return Response.new @response, @response
      end

    end
  end
end

