require 'moip_api'
require 'pry'
require_relative './configuration'

@holder = Moip::Resource::Holder.new fullname: "Joao Silva", birthdate: "1988-12-30", taxDocument: { type: "CPF", number: "12345679891"}, phone: {}

@credit_card = Moip::Resource::CreditCard.new expirationMonth: 12, expirationYear: 25, number: "5555666677778884", cvc: "123", holder: @holder

@funding_instrument = Moip::Resource::FundingInstrument.new method: "CREDIT_CARD", creditCard: @credit_card

@payment = Moip::Resource::Payment.new installmentCount: 2, fundingInstrument: @funding_instrument

@api = Moip::Api.new

@order_id = "ORD-O73CMM2N9TLD"

@response = @api.payment.create(@order_id, @payment)

p @response

binding.pry
