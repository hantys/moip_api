#!/bin/ruby
require 'yaml'
require 'httparty'
require "base64"
require 'active_data'
require 'recursive-open-struct'
require "forwardable"

require 'moip_api/api'
require 'moip_api/config'
require 'moip_api/engine'
require 'moip_api/client'
require 'moip_api/config'
require 'moip_api/client_factory'
require 'moip_api/response'
require 'moip_api/account_api'
require 'moip_api/auth_token_api'
require 'moip_api/auth/basic'
require 'moip_api/auth/oauth'
require 'moip_api/resource/account'
require 'moip_api/resource/user'

module Moip
	class << self

    extend Forwardable

    def_delegators :configuration, :api_token, :api_secret, :app_id, :app_access_token, :app_secret, :app_redirect_uri, :environment

		def configuration
			@configuration ||= Moip::Config.new
		end

		def configure(&block)
			yield configuration
		end
	end
end

