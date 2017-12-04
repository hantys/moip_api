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
    fullname: "rejeqwwwwwwwqct",
    email: "joaosilva@email.com"
  }
}

@body ={
  "ownId": "wqdw",
  "amount": {
    "currency": "BRL",
    "subtotals": {
      "shipping": 1000
    }
  },
  "items": [
    {
      "product": "Descrição do pedido",
      "quantity": 1,
      "detail": "Mais info...",
      "price": 12000
    }
  ],
  "customer": {
    "ownId": "asdsad",
    "fullname": "qwdqwd",
    "email": "nome@email.com",
    "birthDate": "1988-12-30",
    "taxDocument": {
      "type": "CPF",
      "number": "22222222222"
    },
    "phone": {
      "countryCode": "55",
      "areaCode": "11",
      "number": "66778899"
    },
    "shippingAddress": {
      "street": "Avenida Faria Lima",
      "streetNumber": 2927,
      "complement": 8,
      "district": "Itaim",
      "city": "Sao Paulo",
      "state": "SP",
      "country": "BRA",
      "zipCode": "01234000"
    }
  },
  "receivers": [
    {
      "type": "SECONDARY",
      "moipAccount": {
        "id": "MPA-D4020D8BCCAA"
      },
      "amount": {
        "percentual": 30
      }
    }
  ]
}

@response = HTTParty.post "#{@host}/v2/orders", headers: @headers, body: @body.to_json




p @response
