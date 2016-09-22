require 'moip_sandbox'

email = "souriptor_teste@hotmail.com"
cpf = '190.597.863-43'

@auth = Moip::Auth::OAuth.new("96236c8ce7944d80a98cf64ea7f3f2e5_v2")
@client = Moip::Client.new(:sandbox, @auth)
@api = Moip::V2::AccountAPI.new(@client)

@user_params = {
  email: email,
  name: "Pedro Fausto",
  cpf: cpf,
  birthdate: "28/12/1982",
  ddd: '86',
  phone: '99421-1487',
  street: 'rua epitacio pessoa',
  number: '1240',
  district: 'lourival',
  cep: '64023-400',
  city: 'teresina',
  state: 'PI'
}
@user = Moip::Resource::User.new(@user_params)
@obj = @api.create_account(@user)

puts @obj

require 'moip_sandbox'
@auth_basic = Moip::Auth::Basic.new 'YJNG2JJ7EF9D04DOMTGE8T6ZC2TCZACD', 'L4BH67OEOPX8L8KKH9HTTSWMCFZH5H2BYS18FOUK'
@client_basic = Moip::Client.new(:sandbox, @auth_basic)
@api_permission = Moip::V2::AuthTokenAPI.new(@client_basic)
@api_permission.get_permission_uri()
@get_user = @api_permission.generate_token('b8ebc9e382223a0f733d535a81064f45d8a21620')


