require 'httparty'
require 'pry'

@host = "https://sandbox.moip.com.br"

@headers = {'Content-Type' => 'application/json', 'Authorization' => 'Basic WUpORzJKSjdFRjlEMDRET01UR0U4VDZaQzJUQ1pBQ0Q6TDRCSDY3T0VPUFg4TDhLS0g5SFRUU1dNQ0ZaSDVIMkJZUzE4Rk9VSw=='}

@notification_id = "NPR-84NOWE21CH9H"
@response = HTTParty.get "#{@host}/v2/preferences/notifications/#{@notification_id}", headers: @headers


p @response
binding.pry
