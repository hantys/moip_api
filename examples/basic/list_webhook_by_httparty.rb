require 'httparty'
require 'recursive-open-struct'
require 'pry'
class RStruct
  # @author Shiva Bhusal
  # @blog cbabhusal.wordpress.com
  # Recursive OpenStruct
  # #
  def self.new(object)
    if object.is_a?(Hash)
      object = object.clone
      object.each do |key, value|
        new_value = value.to_hash.with_indifferent_access rescue value
        object[key] = new(new_value)
      end
      OpenStruct.new(object)
    elsif object.is_a?(Array)
      object.map do |item|
        new(item)
      end
    else
      object
    end
  end
end

@host = "https://sandbox.moip.com.br"

@headers = {'Content-Type' => 'application/json', 'Authorization' => 'Basic WUpORzJKSjdFRjlEMDRET01UR0U4VDZaQzJUQ1pBQ0Q6TDRCSDY3T0VPUFg4TDhLS0g5SFRUU1dNQ0ZaSDVIMkJZUzE4Rk9VSw=='}

@response = HTTParty.get "#{@host}/v2/webhooks", headers: @headers

@webhooks = RStruct.new(@response.parsed_response)

p @webhooks

binding.pry
