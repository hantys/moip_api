require 'httparty'
require 'pry'

@host = "https://sandbox.moip.com.br"
@host = "https://api.moip.com.br"

@headers = {'Content-Type' => 'application/json', 'Authorization' => 'Basic WUpORzJKSjdFRjlEMDRET01UR0U4VDZaQzJUQ1pBQ0Q6TDRCSDY3T0VPUFg4TDhLS0g5SFRUU1dNQ0ZaSDVIMkJZUzE4Rk9VSw=='}

@response = HTTParty.get "#{@host}/v2/preferences/notifications", headers: @headers

@headers = {'Content-Type' => 'application/json', 'Authorization' => "Basic Mkw1R0NCTTBTQk1aQUlaVFVPR0JQRVhRSllVVk5WR1I6NVBOQlRRTEZQTUJTQ1FaRDNOM1dORlIxVUlBQlZTV1FNRFUxRlBGQw=="}

@response = HTTParty.get "#{@host}/v2/payments/PAY-I8C7SDGRKOWC", headers: @headers

p @response
binding.pry

PAY-I8C7SDGRKOWC

https://sandbox.moip.com.br/v2/payments/payment_id