require 'httparty'
require 'moip_api'

@host = "https://sandbox.moip.com.br"

@headers = {'Content-Type' => 'application/json', 'Authorization' => 'OAuth 96236c8ce7944d80a98cf64ea7f3f2e5_v2'}

@account = {
  email: {
    address: "dev.moip@labs.moip.com.br"
  },
  person: {
    name: "Runscope",
    lastName: "Random 9123",
    taxDocument: {
    type: "CPF",
    number: "123.456.798-91"
  },
  identityDocument: {
    type: "RG",
    number: "434322344",
    issuer: "SSP",
    issueDate: "2000-12-12"
  },
  birthDate: "1990-01-01",
  phone: {
    countryCode: "55",
    areaCode: "11",
    number: "965213244"
  },
  address: {
    street: "Av. Brigadeiro Faria Lima",
    streetNumber: "2927",
    district: "Itaim",
    zipCode: "01234-000",
    city: "São Paulo",
    state: "SP",
    country: "BRA"
  }
  },
  type: "MERCHANT"
}

@body = Moip::Utils.convert_hash_keys_to(:camel_case, @account).to_json

@response = HTTParty.post "#{@host}/v2/accounts", headers: @headers, body: @body

p @response
