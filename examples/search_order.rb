require 'moip_api'
require_relative './configuration'

@order_id = "ORD-X7FR9T67K50C"

@api = Moip::Api.new

p @api.order.show(@order_id)


