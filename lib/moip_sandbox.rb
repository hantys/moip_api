#!/bin/ruby
require 'yaml'
require 'rest_client'
require "base64"
require 'nokogiri'

require 'moip-sandbox/request'
require 'moip-sandbox/client'
require 'moip-sandbox/account_api'
require 'moip-sandbox/parser/account_parser'
require 'moip-sandbox/resource/account'

module Moip
	class << self
	end
end