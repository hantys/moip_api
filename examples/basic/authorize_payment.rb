require 'httparty'
require 'pry'

@host = "https://sandbox.moip.com.br"
@host = "https://api.moip.com.br/v2/channels"

# @headers = {'Content-Type' => 'application/json', 'Authorization' => 'Basic WUpORzJKSjdFRjlEMDRET01UR0U4VDZaQzJUQ1pBQ0Q6TDRCSDY3T0VPUFg4TDhLS0g5SFRUU1dNQ0ZaSDVIMkJZUzE4Rk9VSw=='}
@headers = {'Content-Type' => 'application/json', 'Authorization' => "Basic TVZMUExKUDNVTUVLVkJJME9YWUhMS1ZRMEJWVlNDOFY6RVEwVzhRTFM5U0FVVFFZWUE2MVZNT01KTllJTUdQT05VSEJOS0hPTA=="}

p @headers

payment_id = "PAY-IWHGNC2WC1MS"
amount = "4050"
@response = HTTParty.get "#{@host}/simulador/authorize?payment_id=#{payment_id}&amount=#{amount}", headers: @headers
p @reponse
