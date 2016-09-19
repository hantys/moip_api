#!/bin/ruby
require 'yaml'
require 'rest_client'
require "base64"
require 'nokogiri'

require_relative './moip-sandbox/request'
require_relative './moip-sandbox/account_api'
require_relative './moip-sandbox/parser/account_parser'
require_relative './moip-sandbox/resource/account'

module Moip
	class << self
	end
end