# Biblioteca de integração Moip em Ruby

## Descrição

A biblioteca Moip em Ruby é um conjunto de classes de domínio que facilitam, para o desenvolvedor Ruby, a utilização das funcionalidades que o Moip oferece na forma de APIs. Com a biblioteca instalada e configurada, você pode facilmente integrar funcionalidades como:

 - Criar [requisições de pedidos]
 - Criar [requisições de pagamentos] 
 - Consultar [pedidos por código] 
 - Consultar [pagamentos por código] 
 - Criar [contas de marketplace]
 - Consultar [contas de marketplace]
 
## Requisitos
 - [Ruby] 2.3.0+
 
## Instalação
- Adicione a biblioteca ao seu Gemfile.

```ruby
gem "moip_api", :git => "git://github.com/caverna-labs/moip_api.git"
```

 - Execute o comando `bundle install`.

Para fazer a autenticação, você precisará configurar as credenciais do Moip. Crie o arquivo `config/initializers/moip.rb` com o conteúdo abaixo.

```ruby
Moip.configure do |config|
  config.api_token        = "token do moip"
  config.api_secret       = "secret do moip"
  config.app_id           = 'id da app do moip'
  config.app_access_token = 'token de acesso da app moip'
  config.app_secret       = 'secret da app moip'
  config.app_redirect_uri = 'url de redirecionamento'
  config.environment      = [:development/:production] (ambiente)
end
```

## Pedidos
Para processar pagamentos o Moip exige que seja criado um pedido previamente onde são descristas dados relativos ao pedido como a lista do items que vão ser cobrados e a lista de possiveis recebedores de um pedido. Abaixo está a implementação da criação de um pedido

### Criar pedido

```ruby
require 'moip_api'

# especificação do valor de envido
@amount = Moip::Resource::Amount.new(currency: "BRL", subtotals: {shipping: 50})

# especificação do items ou serviços a serem processados no pagamento
@item = Moip::Resource::Item.new(detail: "Product 1", quantity: 2, price: 2000, product: "Description of a product...")

# especificação da lista das contas que vão receber pagamento na transação
@receiver = Moip::Resource::Receiver.new(type: "SECONDARY", moipAccount: {}, amount: {})

# especificação do endereço do cliente 
@address = Moip::Resource::Address.new(city: "São Paulo", complement: "8", street: "Avenida Faria Lima", streetNumber: "2927", zipCode: "0123400000", state: "SP", type: "SHIPPING", country: "BRA")

# especificação dos dados do cliente do pedido
@customer = Moip::Resource::Customer.new(ownId: 'fefe', fullname: 'jose atonio', email: 'teste@teste.com', taxDocument: {type: 'CPF', number: '037.852.496-83'}, phone: {countryCode: '55', areaCode: '86', number: '99999-9999'}, shippingAddress: @address)

# id próprio do pedido
@ownId = "pedido_exemplo_alecrim-001"

# Especificão final do pedido
@order = Moip::Resource::Order.new(ownId: @ownId, amount: @amount, items: [@item], customer: @customer)

@api = Moip::Api.new

@response = @api.order.create(@order)

```

### Consultar pedido
```ruby
# pending

```

## Pagamentos
Para processar uma transação no Moip é necessário uma vez que o pedido é criado registrar o pagamento referente ao mesmo. Para isso é necessário fazer os passos abaixo.

### Cartão de crédito
```ruby
require 'moip_api'

@holder = Moip::Resource::Holder.new fullname: "Joao Silva", birthdate: "1988-12-30", taxDocument: { type: "CPF", number: "12345679891"}, phone: {}

@credit_card = Moip::Resource::CreditCard.new expirationMonth: 12, expirationYear: 25, number: "5555666677778884", cvc: "123", holder: @holder

@funding_instrument = Moip::Resource::FundingInstrument.new method: "CREDIT_CARD", creditCard: @credit_card

@payment = Moip::Resource::Payment.new installmentCount: 2, fundingInstrument: @funding_instrument

@api = Moip::Api.new

@order_id = "ORD-O73CMM2N9TLD"

@response = @api.payment.create(@order_id, @payment)

```

### Boleto
```
# pending
```

## Contas secundárias

### Conectar contas já existentes

#### Gerar link para conexão
```ruby
require 'moip_api'

@api = Moip::Api.new

@response = @api.connect.get_permission_uri
# => https://connect-sandbox.moip.com.br/oauth/authorize?response_type=code&client_id=APP-M11STAPPOAUt&redirect_uri=https://url.com.br/callback.php&scope=RECEIVE_FUNDS,REFUND,MANAGE_ACCOUNT_INFO
```

#### Implementar callback para receber resposta do Moip

* config/routes.rb
```ruby
get '/auth/moip' => 'users#moip'
```

* app/controllers/users_controller.rb
```ruby
def moip
  @api.connect.generate_token(params['code'])
end
```

### Criar nova conta
```ruby
require 'moip_api'

@address = Moip::Resource::Address.new(
  city: "São Paulo",
  complement: "8",
  street: "Av Pinheiros",
  streetNumber: "5592",
  zipCode: "01234000",
  district: "Centro",
  state: "SP",
  country: "BRA"
)

@person = Moip::Resource::Account::Person.new(
  name: "John",
  lastName: "Doe",
  birthDate: "1980-01-10",
  taxDocument: {
    type: "CPF",
    number: "123.456.798-91"
  },
  identityDocument: {
    type: "RG",
    number: "434322344",
    issuer: "SSP",
    issueDate: "2000-12-12"
  },
  phone: {
    countryCode: "55",
    areaCode: "11",
    number: "965213244"
  },
  address: @address
)

@account = Moip::Resource::Account::Base.new email: { address:'johndoe@mail.com.br' }, person: @person, type: "MERCHANT"

@api = Moip::Api.new

@body = {
  email: {
    address: "dev.moip@labs.moip.com.br"
  },
  person: {
    name: "Runscope",
    lastName: "Random 9123",
    taxDocument: {
    type: "CPF",
    number: "123.456.798-91"
  },
  identityDocument: {
    type: "RG",
    number: "434322344",
    issuer: "SSP",
    issueDate: "2000-12-12"
  },
  birthDate: "1990-01-01",
  phone: {
    countryCode: "55",
    areaCode: "11",
    number: "965213244"
  },
  address: {
    street: "Av. Brigadeiro Faria Lima",
    streetNumber: "2927",
    district: "Itaim",
    zipCode: "01234-000",
    city: "São Paulo",
    state: "SP",
    country: "BRA"
  }
  },
  type: "MERCHANT"
}

@response = @api.account.create(@account)

```
