require 'moip_api'
require 'pry'
require_relative './configuration'

@amount = Moip::Resource::Amount.new(currency: "BRL", subtotals: {shipping: 50})

@item = Moip::Resource::Item.new(detail: "Product 1", quantity: 2, price: 2000, product: "Description of a product...")

@receiver = Moip::Resource::Receiver.new(type: "SECONDARY", moipAccount: { id: "MPA-D4020D8BCCAA"}, amount: {fixed: 1200})

@address = Moip::Resource::Address.new(city: "São Paulo", complement: "8", street: "Avenida Faria Lima", streetNumber: "2927", zipCode: "0123400000", state: "SP", type: "SHIPPING", country: "BRA")

@customer = Moip::Resource::Customer.new(ownId: 'fefe', fullname: 'qdwdw', email: 'teste@teste.com', taxDocument: {type: 'CPF', number: '037.852.496-83'}, phone: {countryCode: '55', areaCode: '86', number: '99999-9999'}, shippingAddress: @address)

# @ownId = Moip::Utils.generate_own_id
@ownId = "pedido_exemplo_alecrim-#{rand(1..1000)}"

@order = Moip::Resource::Order.new(ownId: @ownId,  amount: @amount, items: [@item], customer: @customer, receivers: [@receiver])

@holder = Moip::Resource::Holder.new fullname: "Joao Silva", birthdate: "1988-12-30", taxDocument: { type: "CPF", number: "12345679891"}, phone: {}

@credit_card = Moip::Resource::CreditCard.new expirationMonth: 12, expirationYear: 25, number: "5555666677778884", cvc: "123", holder: @holder

@funding_instrument = Moip::Resource::FundingInstrument.new method: "CREDIT_CARD", creditCard: @credit_card
@escrow = Moip::Resource::Escrow.new description: "custoria ruaalecrim"

@payment = Moip::Resource::Payment.new installmentCount: 2, escrow: @escrow, fundingInstrument: @funding_instrument

@api = Moip::Api.new

@order_created = @api.order.create(@order)

@response_payment = @api.payment.create(@order_created.id, @payment)

@order_id = @order_created.id

order = @api.order.show(@order_id)
escrow_id = order.escrows.last.id


@release = @api.escrow.release(escrow_id)
ECW-COLD7BXKU03P
ORD-9R2S8F24GY47

#reembolso total
@refund = @api.refund.full(@order_id)

#reembolso parcial
@refund = @api.refund.partial(@order_id, 3000)
