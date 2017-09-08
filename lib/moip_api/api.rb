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

    def notification
      Moip::V2::NotificationApi.new(factory.default_basic)
    end

    def webhook
      Moip::V2::WebhookApi.new(factory.default_basic)
    end

    def refund
      Moip::V2::RefundApi.new(factory.default_basic)
    end
  end
end



