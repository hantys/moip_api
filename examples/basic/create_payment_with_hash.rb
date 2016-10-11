require 'httparty'
require 'pry'

@host = "https://sandbox.moip.com.br"

@headers = {'Content-Type' => 'application/json', 'Authorization' => 'Basic WUpORzJKSjdFRjlEMDRET01UR0U4VDZaQzJUQ1pBQ0Q6TDRCSDY3T0VPUFg4TDhLS0g5SFRUU1dNQ0ZaSDVIMkJZUzE4Rk9VSw=='}

@body = {
  installmentCount: 1,
  fundingInstrument: {
    method: "CREDIT_CARD",
    creditCard: {
        hash: "NyuNwQ+8Y0GVogC/rwHbHXRitUBSwJiv3aQKO5y+cg3fsSKa0QXTaVzGNsvTDIpUqVIgBAWdZc3V+yIxlgiZj5shaqz2JcZr6wcmSxX+RNMITGLC7hE33Z96TO/u7e3UlQF8lDBEphE+EM2Or1S6973ZcbENwMZ9sZh3Xoffer5G290AV8ZjnN53QD+QyM0gn6L56utfnXz0se0YsXHZGfUhzlcXE0/wiH46s7PxVKCCoFIuKP3Ay/vpMV3WSQCSQeat2edUNUAdX+Bx1vPz7EMcbQxr3Nj0174rBQ8mmhHnQ0MhIowI6OEA0BROYpbt+rV57EYaZ1HEWDEZtboFJw==",
        holder: {
        fullname: "Jose Portador da Silva",
        birthdate: "1988-12-30",
        taxDocument: {
          type: "CPF",
          number: "33333333333"
        },
        phone: {
          countryCode: "55",
          areaCode: "11",
          number: "66778899"
        }
      }
    }
  }
}

@order_id = "ORD-I9OOOIWGN5ML"

# TODO: tratar quando pagamento ja foi realizado
# "errors"=>[{"code"=>"PAY-999"}]
@response = HTTParty.post "#{@host}/v2/orders/#{@order_id}/payments", headers: @headers, body: @body.to_json


p @response
binding.pry
