### Construindo a gem
gem build ./moip_sandbox.gemspec

### Instalanado a gem
gem install ./moip-sandbox-X.X.X.gem


### Instanciando a autenticação
```
@auth = Moip::Auth::Basic.new("<TOKEN>", "<SECRET>")
```

### Instanciando o client
```
@client = Moip::Client.new(:sandbox/:production, @auth, :v1/:v2)
```

### Instanciando a API de Contas
```
@api = Moip::AccountAPI.new(@client)
```

### Verificando se uma conta já existe
```
@obj = @api.find("renatosousafilho@gmail.com")
```
