require 'moip_sandbox'

email = "souripto4r@hotmail.com"
cpf = '743.845.930-66'

@auth = Moip::Auth::Oauth.new("96236c8ce7944d80a98cf64ea7f3f2e5_v2")
@client = Moip::Client.new(:sandbox, @auth)
@api = Moip::V2::AccountAPI.new(@client)
@user = Moip::Resource::User.new(email, "Pedro Fausto", cpf, "28/12/1982", '86', '99421-1487', 'rua epitacio pessoa', '1240', 'lourival', '64023-400', 'teresina', 'PI')
@obj = @api.create_account(@user)

puts @obj
