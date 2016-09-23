module Moip
  module Auth
    class OAuth
      def initialize
        @secret = Moip.app_access_token
      end

      def header
        %(OAuth #{@secret})
      end
    end
  end
end
