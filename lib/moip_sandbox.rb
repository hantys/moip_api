#!/bin/ruby
require 'yaml'
require 'httparty'
require "base64"
require 'active_data'
require 'recursive-open-struct'
require "forwardable"

require 'moip-sandbox/api'
require 'moip-sandbox/config'
require 'moip-sandbox/client'
require 'moip-sandbox/config'
require 'moip-sandbox/client_factory'
require 'moip-sandbox/response'
require 'moip-sandbox/account_api'
require 'moip-sandbox/auth_token_api'
require 'moip-sandbox/auth/basic'
require 'moip-sandbox/auth/oauth'
require 'moip-sandbox/resource/account'
require 'moip-sandbox/resource/user'

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

