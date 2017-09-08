require 'moip_api'
require 'pry'
require_relative './configuration'

@order_id = "ORD-IEE5E8650XXW"

@api = Moip::Api.new

@response = @api.order.list

binding.pry
"ORD-BXXDD55M46VC"