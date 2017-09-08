#!/bin/ruby
require 'yaml'
require 'httparty'
require "base64"
require 'active_data'
require 'recursive-open-struct'
require "forwardable"

require 'moip_api/api'
require 'moip_api/config'
require 'moip_api/utils'
require 'moip_api/client'
require 'moip_api/config'
require 'moip_api/version'
require 'moip_api/client_factory'
require 'moip_api/response'
require 'moip_api/rstruct'
# api
require 'moip_api/account_api'
require 'moip_api/auth_token_api'
require 'moip_api/order_api'
require 'moip_api/payment_api'
require 'moip_api/notification_api'
require 'moip_api/webhook_api'
require 'moip_api/refund_api'
#auth
require 'moip_api/auth/basic'
require 'moip_api/auth/oauth'
#resource
require 'moip_api/resource/account'
require 'moip_api/resource/user'
require 'moip_api/resource/customer'
require 'moip_api/resource/address'
require 'moip_api/resource/item'
require 'moip_api/resource/amount'
require 'moip_api/resource/receiver'
require 'moip_api/resource/order'
require 'moip_api/resource/payment'
require 'moip_api/resource/billet'
require 'moip_api/resource/credit_card'
require 'moip_api/resource/funding_instrument'
require 'moip_api/resource/holder'
require 'moip_api/resource/webhook'
require 'moip_api/resource/notification'

module Moip
  class << self

    extend Forwardable

    def_delegators :configuration, :api_token, :api_secret, :app_id, :app_access_token, :app_secret, :app_redirect_uri, :environment, :callback_url

    def configuration
      @configuration ||= Moip::Config.new
    end

    def configure(&block)
      yield configuration
    end
  end
end

