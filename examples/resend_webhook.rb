require 'moip_api'
require 'pry'
require_relative './configuration'

@payment_id = "PAY-R0KGH799ORQ3"

@webhook = Moip::Resource::Webhook.new(
  event: "PAYMENT.CANCELLED",
  resourceId: @payment_id
)

  @api = Moip::Api.new

@response = @api.webhook.create(@webhook)

p @response
binding.pry

