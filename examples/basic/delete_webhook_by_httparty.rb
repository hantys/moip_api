require 'httparty'
require 'pry'

@host = "https://sandbox.moip.com.br"

@headers = {'Content-Type' => 'application/json', 'Authorization' => 'Basic WUpORzJKSjdFRjlEMDRET01UR0U4VDZaQzJUQ1pBQ0Q6TDRCSDY3T0VPUFg4TDhLS0g5SFRUU1dNQ0ZaSDVIMkJZUzE4Rk9VSw=='}

@response = HTTParty.get "#{@host}/v2/preferences/notifications", headers: @headers
webhook_ids = @response.collect { |webhook| webhook["id"]}
p webhook_ids

webhook_ids.each do |id|
  @notification_id = id
  @response = HTTParty.delete "#{@host}/v2/preferences/notifications/#{@notification_id}", headers: @headers
end


@response = HTTParty.get "#{@host}/v2/preferences/notifications", headers: @headers
p @response.size
