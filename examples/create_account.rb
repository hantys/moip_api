require 'moip_api'
require_relative './configuration'
require 'pry'

@api = Moip::Api.new

@user_params = {
  email: 'teste@teste.com',
  name: "Pedro Fausto",
  cpf: '000.000.000-00',
  birthdate: "28/12/1982",
  ddd: '99',
  phone: '99999-9999',
  street: 'rua jose pessoa',
  number: '5555',
  district: 'bairro',
  cep: '64000-000',
  city: 'teresina',
  state: 'PI'
}
binding.pry

@user = @api.account.create(@user_params)

p @user
