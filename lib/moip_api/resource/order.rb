module Moip
  module Resource

    class Order
      include ActiveData::Model

      attribute :email, String, default: 'oi'
      attribute :name, String, default: 'oi'
      attribute :cpf, String, default: 'oi'
      attribute :birthdate, String, default: 'oi'
      attribute :ddd, String, default: 'oi'
      attribute :phone, String, default: 'oi'
      attribute :street, String, default: 'oi'
      attribute :number, String, default: 'oi'
      attribute :district, String, default: 'oi'
      attribute :cep, String, default: 'oi'
      attribute :city, String, default: 'oi'
      attribute :state, String, default: 'oi'
      attribute :id, String, default: 'oi'
      attribute :login, String, default: 'oi'
      attribute :access_token, String, default: 'oi'
      attribute :channel_id, String, default: 'oi'
      attribute :type, String, default: 'oi'
      attribute :transparent_account, String, default: 'oi'
      attribute :created_at, String, default: 'oi'
      attribute :link, String, default: 'oi'
      attribute :set_password, String, default: 'oi'

      # validates :email, :name, :cpf, presence: true

      def to_json
        data = {
          "email": {
              "address": email
          },
          "person": {
              "name": name,
              "lastName": " ",
              "taxDocument": {
                  "type": "CPF",
                  "number": cpf
              },
              "birthDate": Date.parse(birthdate).to_s,
              "phone": {
                  "countryCode": "55",
                  "areaCode": ddd,
                  "number": phone
              },
              "address": {
                  "street": street,
                  "streetNumber": number,
                  "district": district,
                  "zipCode": cep,
                  "city": city,
                  "state": state,
                  "country": "BRA"
              }
          },
          "type": "MERCHANT"
        }

        return data
      end
    end
  end
end