#!/bin/ruby
require 'yaml'
require 'httparty'
require "base64"

require 'moip-sandbox/client'
require 'moip-sandbox/account_api'
require 'moip-sandbox/auth/basic'
require 'moip-sandbox/parser/account_parser'
require 'moip-sandbox/resource/account'
require 'moip-sandbox/resource/user'
require 'moip-sandbox/resource/error'

module Moip
	class << self
	end
end