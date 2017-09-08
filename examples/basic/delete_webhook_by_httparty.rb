require 'httparty'
require 'pry'

@host = "https://sandbox.moip.com.br"
# @host = "https://api.moip.com.br"

@headers = {'Content-Type' => 'application/json', 'Authorization' => 'Basic WUpORzJKSjdFRjlEMDRET01UR0U4VDZaQzJUQ1pBQ0Q6TDRCSDY3T0VPUFg4TDhLS0g5SFRUU1dNQ0ZaSDVIMkJZUzE4Rk9VSw=='}
# @headers = {'Content-Type' => 'application/json', 'Authorization' => 'Basic Mkw1R0NCTTBTQk1aQUlaVFVPR0JQRVhRSllVVk5WR1I6NVBOQlRRTEZQTUJTQ1FaRDNOM1dORlIxVUlBQlZTV1FNRFUxRlBGQw=='}

# @response = HTTParty.get "#{@host}/v2/preferences/notifications", headers: @headers
# webhook_ids = @response.collect { |webhook| webhook["id"]}
# p webhook_ids

# webhook_ids.each do |id|
notifications = ["NPR-PKWG9U337HCX", "NPR-KN2Z73NR9DF0", 'NPR-79J2LWQSQFPL', 'NPR-7XL85QKPORZ1']
notification_id = "NPR-9PD6BFYYY2TH"
notifications.each do |notification_id|
  @response = HTTParty.delete "#{@host}/v2/preferences/notifications/#{notification_id}", headers: @headers
end


@response = HTTParty.get "#{@host}/v2/preferences/notifications", headers: @headers
p @response.size
