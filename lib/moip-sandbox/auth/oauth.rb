module Moip
  module Auth
    class OAuth
      def initialize(secret)
        @secret = secret
      end

      def header
        %(OAuth #{@secret})
      end
    end
  end
end
