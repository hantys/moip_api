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

