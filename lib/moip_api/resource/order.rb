module Moip
  module Resource

    class Order
      include ActiveData::Model

      attribute :order_id, String
      attribute :shipping, Integer, default: 0
      attribute :addition, Integer, default: 0
      attribute :discount, Integer, default: 0

      attribute :order_itens, Array, default: []
      attribute :receivers, Array, default: []

      attribute :customer_id, String
      attribute :customer_fullname, String
      attribute :customer_email, String
      attribute :customer_ddd, String, default: ''
      attribute :customer_phone, String, default: ''
      attribute :customer_cpf, String, default: ''

      attribute :shipping_street, String, default: ''
      attribute :shipping_number, String, default: ''
      attribute :shipping_district, String, default: ''
      attribute :shipping_cep, String, default: ''
      attribute :shipping_city, String, default: ''
      attribute :shipping_state, String, default: ''
      attribute :shipping_complement, String, default: ''


      def to_json
        data = {
          "ownId": order_id, #obrigatorio
          "amount": { #valores adicionais do pedido ex: frete, adicional. Seram somados no valor final do pedido
            "currency": "BRL",
            "subtotals": {
              "shipping": shipping.gsub('.', '').gsub(',',''),
              'addition': addition.gsub('.', '').gsub(',',''),
              'discount': discount.gsub('.', '').gsub(',','')
            }
          },
          "items":
          [
            order_itens.each do |item|
              {
                "product": item['name'], #obrigatorio
                "quantity": item['qnt'], #obrigatorio
                "detail": item['detail'],
                "price": item['value'].gsub('.', '').gsub(',','') #obrigatorio
              },
            end
          ],
          "customer": {
            "ownId": customer_id, #obrigatorio
            "fullname": customer_fullname, #obrigatorio
            "email": customer_email, #obrigatorio
            "taxDocument": {
              "type": "CPF",
              "number": customer_cpf
            },
            "phone": {
              "countryCode": "55",
              "areaCode": customer_ddd,
              "number": customer_phone
            },
            "shippingAddress": {
              "street": shipping_street,
              "streetNumber": shipping_number,
              "complement": shipping_complement,
              "district": shipping_district,
              "city": shipping_city,
              "state": shipping_state,
              "country": "BRA",
              "zipCode": shipping_cep
            }
          },
          "receivers": [
            receivers.each do |receiver|
              {
                'type': receiver['type'],
                'moipAccount': {
                  'id': receiver['moip_id']
                },
                'amount': {
                  if receiver.key?(:fixed)
                    'fixed': receiver['fixed'].gsub('.', '').gsub(',',''),
                  elsif receiver.key?(:percentual)
                    'percentual': receiver['percentual'],
                  end
                }
              }
            end
          ]
        }

        return data
      end
    end
  end
end