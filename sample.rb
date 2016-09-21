require 'moip_sandbox'

email = "souripto4r@hotmail.com"
cpf = '743.845.930-66'

@auth = Moip::Auth::Oauth.new("96236c8ce7944d80a98cf64ea7f3f2e5_v2")
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
