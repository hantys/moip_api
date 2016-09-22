#!/bin/ruby
require 'yaml'
require 'httparty'
require "base64"
require 'active_data'
require 'recursive-open-struct'

require 'moip-sandbox/api'
require 'moip-sandbox/client'
require 'moip-sandbox/client_factory'
require 'moip-sandbox/response'
require 'moip-sandbox/account_api'
require 'moip-sandbox/auth_token_api'
require 'moip-sandbox/auth/basic'
require 'moip-sandbox/auth/oauth'
require 'moip-sandbox/parser/account_parser'
require 'moip-sandbox/resource/account'
require 'moip-sandbox/resource/user'

module Moip
	class << self
	end
end