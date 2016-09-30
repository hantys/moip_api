require 'moip_api'
require_relative './configuration'
require 'pry'

@address = Moip::Resource::Address.new(
  city: "São Paulo",
  complement: "8",
  street: "Av Pinheiros",
  streetNumber: "5592",
  zipCode: "01234000",
  district: "Centro",
  state: "SP",
  country: "BRA"
)

@person = Moip::Resource::Account::Person.new(
  name: "John",
  lastName: "Doe",
  birthDate: "1980-01-10",
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
  phone: {
    countryCode: "55",
    areaCode: "11",
    number: "965213244"
  },
  address: @address
)

@account = Moip::Resource::Account::Base.new email: { address:'johndoe@mail.com.br' }, person: @person, type: "MERCHANT"

@api = Moip::Api.new

@body = {
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

@response = @api.account.create(@account)

p @response
