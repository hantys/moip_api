require 'httparty'
require 'pry'

@host = "https://sandbox.moip.com.br"

@headers = {'Content-Type' => 'application/json', 'Authorization' => 'Basic WUpORzJKSjdFRjlEMDRET01UR0U4VDZaQzJUQ1pBQ0Q6TDRCSDY3T0VPUFg4TDhLS0g5SFRUU1dNQ0ZaSDVIMkJZUzE4Rk9VSw=='}

@body = { 
  events: [
    "ORDER.*",
    "PAYMENT.AUTHORIZED",
    "PAYMENT.CANCELLED"
  ],
  target: "http://teste.ruaalecrim.com.br/moip/payment",
  media: "WEBHOOK"
}

@response = HTTParty.post "#{@host}/v2/preferences/notifications", headers: @headers, body: @body.to_json


p @response
binding.pry
