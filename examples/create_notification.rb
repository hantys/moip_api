require 'moip_api'
require 'pry'
require_relative './configuration'

@api = Moip::Api.new

@notification = Moip::Resource::Notification.new(events: ["PAYMENT.CANCELLED"], target: "https://ruaalecrim.com.br/moip/cancelled", media: "WEBHOOK")

@api.notification.create(@notification)

@list = @api.notification.list

binding.pry

