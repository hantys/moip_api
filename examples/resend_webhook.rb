require 'moip_api'
require 'pry'
require_relative './configuration'

@payment_id = "PAY-QBQZM4HEPVML"

@webhook = Moip::Resource::Webhook.new(
  event: "PAYMENT.AUTHORIZED",
  resourceId: @payment_id
)

@api = Moip::Api.new

@response = @api.webhook.create(@webhook)

p @response
binding.pry

