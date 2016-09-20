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
@api = Moip::V2::AccountAPI.new(@client)
```

### Instanciando objeto para criação de uma nova conta moip para vendedor
```
@user = Moip::Resource::User.new(email, name, cpf, birthdate, ddd, phone, street, number, district, cep, city, state)

@obj = @api.create_account(@user)
```

### Verificando se uma conta já existe
```
@api_v1 = Moip::V1::AccountAPI.new(@client)
@obj = @api_v1.find("renatosousafilho@gmail.com")
```
