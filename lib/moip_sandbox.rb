#!/bin/ruby
require 'yaml'
require 'rest_client'
require "base64"
require 'nokogiri'
require 'pry'

require_relative './moip-sandbox/request'
require_relative './moip-sandbox/resource/account'

module Moip
	class << self
	end
end