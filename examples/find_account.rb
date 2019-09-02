require 'moip_api'
require 'pry'
require_relative './configuration'

binding.pry
@api = Moip::Api.new
"MPA-D4020D8BCCAA"
MPA-B0A39341DD8D
@account_id = "MPA-B0A39341DD8D"
@response = @api.account.find(@account_id)
# @response = @api.account.find(@account_id)

p @response
