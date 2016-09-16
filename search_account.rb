#!/bin/ruby
require 'yaml'
require 'rest_client'
require "base64"
require 'nokogiri'
  require 'pry'

module Moip
  module Request
    def self.build_request(method, base_url, endpoint)
      resource = base_url+endpoint
      RestClient::Request.execute(method: method, url: resource, headers: default_headers)
    end

    private

    def self.load_config
      @config = YAML.load_file('config/moip.yml')
      @api_key = @config["production"]["api_token"]
      @api_secret = @config["production"]["api_secret"]
      @token = Base64.strict_encode64("#{@api_key}:#{@api_secret}")
    end

    def self.default_headers
      self.load_config
      {
  "     Content-Type": "application/xml",
  "     Authorization": "Basic #{@token} "
      }
    end
  end
end

@email = "renatosousafilho@gmail.com"

@response = Moip::Request.build_request(:get, "https://desenvolvedor.moip.com.br/sandbox/ws/alpha", "/VerificarConta/#{@email}")

@doc = Nokogiri::XML(@response)

p @doc
