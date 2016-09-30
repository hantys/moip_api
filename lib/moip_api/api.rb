module Moip
  class Api
    attr_reader :factory

    def initialize
      @factory = ClientFactory.new
    end

    def connect
      Moip::V2::AuthTokenAPI.new(factory.connect_basic)
    end

    def account
      Moip::V2::AccountAPI.new(factory.default_oauth)
    end

    def order
      Moip::V2::OrderApi.new(factory.default_basic)
    end

    def payment
      Moip::V2::PaymentApi.new(factory.default_basic)
    end
  end
end



