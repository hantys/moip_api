require 'moip_api'
require 'pry'

@amount = Moip::Resource::Amount.new(currency: "BRL", subtotals: {shipping: 50})

@receiver = Moip::Resource::Receiver.new(type: "SECONDARY", moipAccount: {}, amount: {})

@item = Moip::Resource::Item.new(detail: "Product 1", quantity: 2, price: 2000, product: "Description of a product...")

@order = Moip::Resource::Order.new(amount: @amount, receivers: [@receiver])

binding.pry
