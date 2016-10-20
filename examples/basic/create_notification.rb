require 'httparty'
require 'pry'

@host = "https://sandbox.moip.com.br"

@headers = {'Content-Type' => 'application/json', 'Authorization' => 'Basic WUpORzJKSjdFRjlEMDRET01UR0U4VDZaQzJUQ1pBQ0Q6TDRCSDY3T0VPUFg4TDhLS0g5SFRUU1dNQ0ZaSDVIMkJZUzE4Rk9VSw=='}

@body = { 
  events: [
    "PAYMENT.AUTHORIZED",
  ],
  target: "http://sandbox.ruaalecrim.com.br/moip/authorized",
  media: "WEBHOOK"
}

@response = HTTParty.post "#{@host}/v2/preferences/notifications", headers: @headers, body: @body.to_json
p @response.parsed_response["token"]


@body = { 
  events: [
    "PAYMENT.CANCELLED"
  ],
  target: "http://sandbox.ruaalecrim.com.br/moip/cancelled",
  media: "WEBHOOK"
}

@response = HTTParty.post "#{@host}/v2/preferences/notifications", headers: @headers, body: @body.to_json

p @response.parsed_response["token"]
