### Usuario para teste de conta secundaria
conta teste:
  -https://conta-sandbox.moip.com.br
  -souriptor@hotmail.com
  -pi854098
  -MPA-909AD3837493

### Construindo a gem
gem build ./moip_sandbox.gemspec

### Instalanado a gem
gem install ./moip-sandbox-X.X.X.gem


### Instanciando a autenticação Basic
```
@auth = Moip::Auth::Basic.new("<TOKEN>", "<SECRET>")
```

### Instanciando a autenticação Oauth
```
@auth = Moip::Auth::Oauth.new("<SECRET>")
```

### Instanciando o client
```
@client = Moip::Client.new(:sandbox/:production, @auth, :v1/:v2)
```

### Instanciando a API de Contas Moip
```
@api_account = Moip::V2::AccountAPI.new(@client)
```

### Instanciando objeto para criação de uma nova conta moip para vendedor
```
@user_params = {
  email: email,
  name: "Pedro Fausto",
  cpf: '000.000.000-00',
  birthdate: "28/12/1982",
  ddd: '86',
  phone: '99999-9999',
  street: 'rua epitacio pessoa',
  number: '5555',
  district: 'lourival',
  cep: '64000-000',
  city: 'teresina',
  state: 'PI'
}
@user = Moip::Resource::User.new(@user_params)
retorno do objeto:
#<Moip::Resource::User email: "souriptor@hotmail.com", name: "Pedro Fausto", cpf: "282.335.551-00", birthdate: "28/12/1982", ddd: "86", phone: "99421-1487", street: "rua epitacio pessoa", number: "1240", district: "lourival", cep: "64023-400", city: "teresina", state: "PI", id: nil, login: nil, access_token: nil, channel_id: nil, type: nil, transparent_account: nil, created_at: nil, link: nil, set_password: nil>

```

### criando o usuario
```
@obj = @api_account.create_account(@user)

Se cpf já existir, retorno:
=> #<RecursiveOpenStruct errors=[{:code=>"REG-002", :path=>"v2/accounts", :description=>"Tax document has already been taken!"}], additionalInfo={:account=>{:id=>"MPA-CBC872FEC5AD", :email=>"souript2or@hotmail.com", :login=>"souript2or@hotmail.com"}}>

Se email já existir, retorno:
=> #<RecursiveOpenStruct errors=[{:code=>"REG-001", :path=>"v2/accounts", :description=>"Email has already been taken!"}], additionalInfo={:account=>{:id=>"MPA-909AD3837493", :email=>"souriptor@hotmail.com", :login=>"souriptor@hotmail.com"}}>

Se usuário criado com sucesso, retorno:
=> #<RecursiveOpenStruct id="MPA-58091C09070A", login="souriptor_teste@hotmail.com", accessToken="70dfcdbd61f64b25bb87330401aaeac7_v2", channelId="APP-IYDQO7981OKQ", type="MERCHANT", transparentAccount=false, email={:address=>"souriptor_teste@hotmail.com", :confirmed=>false}, person={:name=>"Pedro", :lastName=>"Fausto", :birthDate=>"1982-12-28", :taxDocument=>{:type=>"CPF", :number=>"190.597.863-43"}, :address=>{:street=>"rua epitacio pessoa", :streetNumber=>"1240", :district=>"lourival", :zipcode=>"64023400", :zipCode=>"64023400", :city=>"teresina", :state=>"PI", :country=>"BRA"}, :phone=>{:countryCode=>"55", :areaCode=>"86", :number=>"994211487"}}, createdAt="2016-09-22T12:39:10.246Z", _links={:self=>{:href=>"https://sandbox.moip.com.br/moipaccounts/MPA-58091C09070A", :title=>nil}, :setPassword=>{:href=>"https://desenvolvedor.moip.com.br/sandbox/AskForNewPassword.do?method=confirm&email=souriptor_teste%40hotmail.com&code=5763385f53e294909bde40dbcacf500b"}}>
```

### Busca um usuário Moip pelo MOIP_ID
```
# Verifica apenas se o login existe na base de dados
@moip_user = @api_account.find(@obj.id)
```

### Verificando se uma conta já existe
```

#busca na v1 do moip
@api_v1 = Moip::V1::AccountAPI.new(@client)

# Verifica apenas se o login existe na base de dados
@obj = @api_v1.find("renatosousafilho@gmail.com")
```
