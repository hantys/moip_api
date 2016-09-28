require 'httparty'
require 'pry'

@host = "https://sandbox.moip.com.br"

@headers = {'Content-Type' => 'application/json', 'Authorization' => 'Basic WUpORzJKSjdFRjlEMDRET01UR0U4VDZaQzJUQ1pBQ0Q6TDRCSDY3T0VPUFg4TDhLS0g5SFRUU1dNQ0ZaSDVIMkJZUzE4Rk9VSw=='}

@body = {
  ownId: "pedido_xyz",
  items: [
    {
      product: "Box de Seriado - Exterminate!",
      quantity: 1,
      detail: "Box de seriado com 8 dvds",
      price: 7300
    }
  ],
  customer: {
    ownId: "cliente_xyz",
    fullname: "João Silva",
    email: "joaosilva@email.com"
  }
}

@response = HTTParty.post "#{@host}/v2/orders", headers: @headers, body: @body.to_json


p @response
binding.pry
