require 'moip_api'
require 'pry'
require 'recursive-open-struct'
require_relative './configuration'

@order_id = "ORD-SHFAPVHTH5IO"

@api = Moip::Api.new

@response = @api.notification.list

binding.pry

