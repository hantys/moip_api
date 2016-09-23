### Usuario para teste de conta secundaria
conta teste:
  -https://conta-sandbox.moip.com.br
  -<EMAIL>  
  -<PASSWORD>
  -<MOIP_ID>

### Construindo a gem
gem build ./moip_sandbox.gemspec

### Instalanado a gem
gem install ./moip-sandbox-X.X.X.gem
require 'moip_sandbox'

### Configurando dados de ambiente
```
Moip.configure do |config|
  config.api_token="YJNG2JJ7EF9D04DOMTGE8T6ZC2TCZACD"
  config.api_secret="L4BH67OEOPX8L8KKH9HTTSWMCFZH5H2BYS18FOUK"
  config.app_id = 'APP-IYDQO7981OKQ'
  config.app_access_token = '96236c8ce7944d80a98cf64ea7f3f2e5_v2'
  config.app_secret = '071f4f6be2ca47e0bdc4f7d9242273f2'
  config.app_redirect_uri = 'http://teste.ruaalecrim.com.br/auth/moip'
  config.environment = :development
end
``` 

### Instanciando api
```
@api = Moip::Api.new()

 * Metodos da api:
  - @api.account (utilizado para criacao e busca de contas moip)
  - @api.connect (utilizado para permissoes de terceiros)
```


### criando o usuario moip
```
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

@user = @api.account.create(@user_params)

Se cpf já existir, retorno:
=> #<RecursiveOpenStruct errors=[{:code=>"REG-002", :path=>"v2/accounts", :description=>"Tax document has already been taken!"}], additionalInfo={:account=>{:id=>"MPA-CBC872FEC5AD", :email=>"souript2or@hotmail.com", :login=>"souript2or@hotmail.com"}}>

Se email já existir, retorno:
=> #<RecursiveOpenStruct errors=[{:code=>"REG-001", :path=>"v2/accounts", :description=>"Email has already been taken!"}], additionalInfo={:account=>{:id=>"MPA-909AD3837493", :email=>"souriptor@hotmail.com", :login=>"souriptor@hotmail.com"}}>

Se usuário criado com sucesso, retorno:
=> #<RecursiveOpenStruct id="MPA-58091C09070A", login="souriptor_teste@hotmail.com", accessToken="70dfcdbd61f64b25bb87330401aaeac7_v2", channelId="APP-IYDQO7981OKQ", type="MERCHANT", transparentAccount=false, email={:address=>"souriptor_teste@hotmail.com", :confirmed=>false}, person={:name=>"Pedro", :lastName=>"Fausto", :birthDate=>"1982-12-28", :taxDocument=>{:type=>"CPF", :number=>"190.597.993-43"}, :address=>{:street=>"rua jose pessoa", :streetNumber=>"4444", :district=>"bairro", :zipcode=>"48352400", :zipCode=>"48352400", :city=>"teresina", :state=>"PI", :country=>"BRA"}, :phone=>{:countryCode=>"55", :areaCode=>"99", :number=>"999999999"}}, createdAt="2016-09-22T12:39:10.246Z", _links={:self=>{:href=>"https://sandbox.moip.com.br/moipaccounts/MPA-58091C09070A", :title=>nil}, :setPassword=>{:href=>"https://desenvolvedor.moip.com.br/sandbox/AskForNewPassword.do?method=confirm&email=souriptor_teste%40hotmail.com&code=5763385f53e294909bde40dbcacf500b"}}>
```

### Busca um usuário Moip pelo MOIP_ID
```
# Verifica apenas se o login existe na base de dados

@moip_user = @api.account.find("MPA-58091C09070A")

retorno:
=> #<RecursiveOpenStruct id="MPA-58091C09070A", person={:lastName=>"Fausto", :phone=>{:areaCode=>"99", :countryCode=>"55", :number=>"999999999"}, :address=>{:zipcode=>"48352-400", :zipCode=>"48352-400", :street=>"rua jose pessoa", :state=>"PI", :streetNumber=>"4444", :district=>"bairro", :country=>"BRA", :city=>"teresina"}, :taxDocument=>{:number=>"190.597.993-43", :type=>"CPF"}, :name=>"Pedro", :birthDate=>"1982-12-28"}, transparentAccount=false, email={:confirmed=>true, :address=>"souriptor_teste@hotmail.com"}, createdAt="2016-09-22T09:39:10.000-03:00", _links={:self=>{:href=>"https://sandbox.moip.com.br/accounts/MPA-58091C09070A"}}, softDescriptor="souriptortes", login="souriptor_teste@hotmail.com", type="MERCHANT">
```

### Permissão de terceiros
```
#Se o usuário já possuir uma conta moip:

- gerando o link para permissão
  @link = @api.connect.get_permission_uri()

  retorno:
  "https://connect-sandbox.moip.com.br/oauth/authorize?response_type=code&client_id=APP-M11STAPPOAUt&redirect_uri=https://url.com.br/callback.php&scope=RECEIVE_FUNDS,REFUND,MANAGE_ACCOUNT_INFO"

- na aplicação você deve configurar uma url de retorno e criar um metodo para receber o code

  * config/routes.rb
    get '/auth/moip' => 'users#moip'

  * app/controllers/users_controller.rb

    def moip
      @api.connect.generate_token(params['code'])
    end

- retorno do metodo generate_token('code'):
=> #<RecursiveOpenStruct accessToken="4da6cec3a3ed4b24455e94cb43f57cba_v2", access_token="4da6cec3a3ed4b24455e94cb43f57cba_v2", expires_in="2026-09-22", refreshToken="64347001b4ec432ca948e5ed32d23b03_v2", refresh_token="64347001b4ec432ca948e5ed32d23b03_v2", scope="RECEIVE_FUNDS,REFUND,MANAGE_ACCOUNT_INFO", moipAccount={"id"=>"MPA-10EB343E384B3"}>

```
