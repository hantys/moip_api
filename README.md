### Usuario para teste de conta secundaria
conta teste:
  -https://conta-sandbox.moip.com.br
  -<EMAIL>  
  -<PASSWORD>
  -<MOIP_ID>

### Construindo a gem
```
gem build ./moip_api.gemspec
```

### Instalanado a gem
```
gem install ./moip_api-X.X.X.gem
require 'moip_api'
gem "moip_api", :git => "git://github.com/caverna-labs/moip_api.git"
```

### Configurando dados de ambiente
```
Moip.configure do |config|
  config.api_token=ENV["TOKEN"]
  config.api_secret=ENV["SECRET"]
  config.app_id = ENV["APP_ID"]
  config.app_access_token=ENV["ACCESS_TOKEN"]
  config.app_secret = ENV["APP_SECRET"]
  config.app_redirect_uri = ENV["REDIRECT_URI"]
  config.environment = ENV["ENVIRONMENT"]
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

### Criando uma ordem de pagamento:

```
{
  order_id: '99', #obrigatorio, Id próprio do pedido. Referência externa
  shipping: '23,00', #opcional, Valor de frete do item, será somado ao valor dos itens. Ex: deve ser informado 10,32, 10.32 ou 10.00
  addition: '9.23', #opcional, Valor adicional ao item, será somado ao valor dos itens. Ex: deve ser informado 10,32, 10.32 ou 10.00
  discount: '10,00', #opcional, Valor de desconto do item, será subtraído do valor total dos itens. Ex: deve ser informado 10,32, 10.32 ou 10.00
  customer_id: '6364', #obrigatorio, Id próprio do cliente. Referência externa.
  customer_fullname: 'joao da silva', #obrigatorio,  Nome completo do cliente.
  customer_email: 'cliente@cliente.com', #obrigatorio, Email do cliente.
  customer_ddd: '99', #opcional, DDD (código local) do telefone.
  customer_phone: '99999-9999', #opcional, Número do telefone.
  customer_cpf: '999.999.999-99', #opcional, Número do cpf.
  shipping_street: 'miguel rosa', #opcional, Endereços de entrega do cliente.
  shipping_number: '3423', #opcional, Numero da casa de entrega do cliente.
  shipping_district: 'vermelha', #opcional, Bairro de entrega do cliente.
  shipping_cep: '64023-000', #opcional, CEP de entrega do cliente
  shipping_city: 'teresina', #opcional, Cidade de entrega do cliente
  shipping_state: 'PI', #opcional, Estado de entrega do cliente
  shipping_complement: '', #opcional, Complemento de entrega do cliente

  #o parametro order_itens é obrigatório
  order_itens: [
    {
      name: 'cadeira', #Nome do produto.
      qnt: 2, #Quantidade de produtos.
      detail: 'cadeira de plastico', #opcional, Descrição adicional do produto.
      value: '40,52', #Valor inicial do item. (O valor será multiplicado de acordo com a quantidade de items.) Em centavos Ex: deve ser informado 10,32, 10.32 ou 10.00
    },
    {
      name: 'mesa',
      qnt: 1,
      detail: 'mesa de plastico',
      value: '100,00',
    },
  ],

  # receivers e obrigatorio apenas para vendas de marketplace (split), se não for utilizar deixa em branco
  receivers: [
    {
      type: 'PRIMARY', # Define qual o tipo de recebedor do pagamento, valores possíveis: PRIMARY, SECONDARY
      moip_id: 'MOP-ID1', # Id Moip da Conta Moip que irá receber valores do pagamento. O identificador é obtido por meio da permissão Oauth

      # preencha apenas 'fixo' ou 'percentual'
      fixed: '200,00', #Valor fixo a ser recebido. Em centavos Ex: deve ser informado 10,32
      percentual: 70, #Valor percentual a ser recebido. Em percentual de 0 há 100
    },
    {
      type: 'SECONDARY',
      moip_id: 'MOP-ID2',
      fixed: '23,42',
      percentual: 30,
    },
  ],
}
```