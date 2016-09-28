require 'moip_api'
require 'pry'

@amount = Moip::Resource::Amount.new(currency: "BRL", subtotals: {shipping: 50})



@order = Moip::Resource::Order.new(
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
)

p @order.to_json
binding.pry
