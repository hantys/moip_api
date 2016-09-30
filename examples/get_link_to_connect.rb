require 'moip_api'
require 'pry'
require_relative './configuration'

@api = Moip::Api.new

@response = @api.connect.get_permission_uri

p @response

