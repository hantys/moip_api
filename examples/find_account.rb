require 'moip_api'
require_relative './configuration'

@api = Moip::Api.new

@account_id = "MPA-58091C09070A"
@response = @api.account.find(@account_id)

p @response
