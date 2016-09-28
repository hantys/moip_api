module Moip
  module Resource

    class Order
      include ActiveData::Model

      attribute :order_id, String, default: '0'
      attribute :shipping, String, default: '0'
      attribute :addition, String, default: '0'
      attribute :discount, String, default: '0'

      attribute :order_itens, mode: :arrayed, type: Array, default: []
      attribute :receivers, mode: :arrayed, type: Array, default: []

      attribute :customer_id, String, default: '0'
      attribute :customer_fullname, String, default: '0'
      attribute :customer_email, String, default: '0'
      attribute :customer_ddd, String, default: '0'
      attribute :customer_phone, String, default: '0'
      attribute :customer_cpf, String, default: '0'

      attribute :shipping_street, String, default: '0'
      attribute :shipping_number, String, default: '0'
      attribute :shipping_district, String, default: '0'
      attribute :shipping_cep, String, default: '0'
      attribute :shipping_city, String, default: '0'
      attribute :shipping_state, String, default: '0'
      attribute :shipping_complement, String, default: '0'

      def to_json
        data = "{
                  'ownId': #{order_id},
                  #{get_amount()},
                  #{get_itens()},
                  #{get_customer()},
                  #{get_receivers() unless receivers == []}
                }"

        return (data)
      end

      private

        def get_amount
          data  = "'amount': {
                    'currency': 'BRL',
                    'subtotals': {
                      'shipping': #{shipping.gsub('.', '').gsub(',','')},
                      'addition': #{addition.gsub('.', '').gsub(',','')},
                      'discount': #{discount.gsub('.', '').gsub(',','')}
                    }
                  }"
          return data
        end

        def get_itens
          itens_array = order_itens.each do |item|
            "{
                'product': #{item[:name]},
                'quantity': #{item[:qnt]},
                'detail': #{item[:detail]},
                'price': #{item[:value].gsub('.', '').gsub(',','')}
              },"
          end

          data = "'items': #{itens_array}"
          return data
        end

        def get_receivers
          receivers_array = receivers.each do |receiver|
            "{
              'type': #{receiver[:type]},
              'moipAccount': {
                'id': #{receiver[:moip_id]}
              },
              'amount': {
                'fixed': #{receiver.key?(:fixed) ? receiver[:fixed].gsub('.', '').gsub(',', '') : 0 },
                'percentual': #{receiver.key?(:percentual) ? receiver[:percentual].gsub('.', '').gsub(',', '') : 0 }
              }
            },"
          end

          data = "'receivers': #{receivers_array}"
          return data
        end

        def get_customer
          data = "'customer': {
                      'ownId': #{customer_id},
                      'fullname': #{customer_fullname},
                      'email': #{customer_email},
                      'taxDocument': {
                        'type': 'CPF',
                        'number': #{customer_cpf}
                      },
                      #{get_phone()},
                      #{get_shippingAddress()}
                    }"
        end

        def get_phone
          data = "'phone': {
                    'countryCode': '55',
                    'areaCode': #{customer_ddd},
                    'number': #{customer_phone}
                  }"

          return data
        end

        def get_shippingAddress
          data = "'shippingAddress': {
                  'street': #{shipping_street},
                  'streetNumber': #{shipping_number},
                  'complement': #{shipping_complement},
                  'district': #{shipping_district},
                  'city': #{shipping_city},
                  'state': #{shipping_state},
                  'country': 'BRA',
                  'zipCode': #{shipping_cep}
                }"

          return data
        end

    end
  end
end