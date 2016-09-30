require 'moip_api'
require_relative './configuration'
require 'pry'

@address = Moip::Resource::Address.new
@person = Moip::Resource::Account::Person.new
@account = Moip::Resource::Account.new email: 'johndoe@mail.com.br'

p @account

# @user_params = {
#   email: 'teste@teste.com',
#   name: "Pedro Fausto",
#   cpf: '000.000.000-00',
#   birthdate: "28/12/1982",
#   ddd: '99',
#   phone: '99999-9999',
#   street: 'rua jose pessoa',
#   number: '5555',
#   district: 'bairro',
#   cep: '64000-000',
#   city: 'teresina',
#   state: 'PI'
# }
# 
# @api = Moip::Api.new
# 
# @user = @api.account.create(@user_params)
# 
# p @user
