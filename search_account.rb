#!/bin/ruby
require 'rest_client'


@token = "WUpORzJKSjdFRjlEMDRET01UR0U4VDZaQzJUQ1pBQ0Q6TDRCSDY3T0VPUFg4TDhLS0g5SFRUU1dNQ0ZaSDVIMkJZUzE4Rk9VSw=="

module Moip
  module Request
    def self.build_request(method, base_url, endpoint)
      resource = base_url+endpoint
      RestClient::Request.execute(method: method, url: resource, headers: default_headers)
    end

    private

    def self.default_headers
      {
  "     Content-Type": "application/xml",
  "     Authorization": "Basic #{@token} "
      }
    end
  end
end

@email = "renatosousafilho@gmail.com"

response = Moip::Request.build_request(:get, "https://desenvolvedor.moip.com.br/sandbox/ws/alpha", "/VerificarConta/#{@email}")

p response
