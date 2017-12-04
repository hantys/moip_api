module Moip
  module V2
    class EscrowApi

      attr_reader :client

      def initialize(client)
        @client = client
      end

      def release(escrow_id)
        @response= client.post("/escrows/#{escrow_id}/release", {})
        @response
        # return Response.new @response, @response
      end

    end
  end
end
