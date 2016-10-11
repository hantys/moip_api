require 'moip_api'
require_relative './configuration'
require 'pry'

@api = Moip::Api.new

@code = "5924553c683d0875e2c39c1f64711a966282cc07"

@response = @api.connect.generate_token(@code)

p @response

binding.pry
