require 'moip_api'
require 'pry'
require_relative './configuration'

@amount = Moip::Resource::Amount.new(currency: "BRL", subtotals: {shipping: 50})

@item = Moip::Resource::Item.new(detail: "Product 1", quantity: 2, price: 2000, product: "Description of a product...")

@receiver = Moip::Resource::Receiver.new(type: "SECONDARY", moipAccount: {}, amount: {})

@address = Moip::Resource::Address.new(city: "São Paulo", complement: "8", street: "Avenida Faria Lima", streetNumber: "2927", zipCode: "0123400000", state: "SP", type: "SHIPPING", country: "BRA")

@customer = Moip::Resource::Customer.new(ownId: 'fefe', fullname: 'jose atonio', email: 'teste@teste.com', taxDocument: {type: 'CPF', number: '037.852.496-83'}, phone: {countryCode: '55', areaCode: '86', number: '99999-9999'}, shippingAddress: @address)

# @ownId = Moip::Utils.generate_own_id
@ownId = "pedido_exemplo_alecrim-001"

@order = Moip::Resource::Order.new(ownId: @ownId, amount: @amount, items: [@item], customer: @customer)

@billet = Moip::Resource::Billet.new expirationDate: "2016-11-11"

@funding_instrument = Moip::Resource::FundingInstrument.new method: "BOLETO", boleto: @billet

@payment = Moip::Resource::Payment.new installmentCount: 1, fundingInstrument: @funding_instrument

@api = Moip::Api.new

@order_created = @api.order.create(@order)

@response_payment = @api.payment.create(@order_created.id, @payment)

p @response_payment

binding.pry



