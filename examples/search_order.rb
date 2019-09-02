require 'moip_api'
require 'pry'
require_relative './configuration'

@order_id = "ORD-CDGR0UED3MT0"

@api = Moip::Api.new

@response = @api.order.show(@order_id)

binding.pry
