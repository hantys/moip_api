require 'httparty'
require 'pry'

@host = "https://sandbox.moip.com.br"

@headers = {'Content-Type' => 'application/json', 'Authorization' => 'Basic WUpORzJKSjdFRjlEMDRET01UR0U4VDZaQzJUQ1pBQ0Q6TDRCSDY3T0VPUFg4TDhLS0g5SFRUU1dNQ0ZaSDVIMkJZUzE4Rk9VSw=='}

@body = {
  installmentCount: 1,
  fundingInstrument: {
    method: "CREDIT_CARD",
    creditCard: {
      expirationMonth: 12,
      expirationYear: 25,
      number: "5555666677778884",
      cvc: "123",
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

@order_id = "ORD-ESHMCPGS2L1S"

# TODO: tratar quando pagamento ja foi realizado
# "errors"=>[{"code"=>"PAY-999"}]
@response = HTTParty.post "#{@host}/v2/orders/#{@order_id}/payments", headers: @headers, body: @body.to_json


p @response
