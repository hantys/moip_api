require 'httparty'
require 'pry'

@host = "https://sandbox.moip.com.br"

@headers = {'Content-Type' => 'application/json', 'Authorization' => 'Basic WUpORzJKSjdFRjlEMDRET01UR0U4VDZaQzJUQ1pBQ0Q6TDRCSDY3T0VPUFg4TDhLS0g5SFRUU1dNQ0ZaSDVIMkJZUzE4Rk9VSw=='}

p @headers

payment_id = "PAY-IWHGNC2WC1MS"
amount = "4050"
@response = HTTParty.get "#{@host}/simulador/authorize?payment_id=#{payment_id}&amount=#{amount}", headers: @headers
p @reponse
