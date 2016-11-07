require 'moip_api'
require 'pry'
require_relative './configuration'

@api = Moip::Api.new

@notification = Moip::Resource::Notification.new(events: ["PAYMENT.AUTHORIZED"], target: "example.com/authorized", media: "WEBHOOK")

@api.notification.create(@notification)

@list = @api.notification.list

binding.pry

