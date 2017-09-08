require 'moip_api'
require_relative './configuration'
require 'pry'

binding.pry
@api = Moip::Api.new
"MPA-D4020D8BCCAA"

@account_id = "MPA-AHMTL9HHBUJW"
@response = @api.account.find(@account_id)
# @response = @api.account.find(@account_id)

p @response
