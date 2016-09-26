module Moip
  module V2
    class OrderApi

      attr_reader :client

      def initialize(client)
        @client = client
      end

      def base_path
        "/v2/orders"
      end

      def create(order)
        @response = client, client.post(base_path, order)
	      return Response.new @response, @response.parsed_response
      end

      def show(id)
        @response = client, client.get("#{base_path}/#{id}")
	      return Response.new @response, @response.parsed_response
      end

    end

  end
end
