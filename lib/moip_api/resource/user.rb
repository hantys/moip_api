module Moip
  module Resource

    class User
      include ActiveData::Model

      attribute :email, String, default: ''
      attribute :name, String, default: ''
      attribute :cpf, String, default: ''
      attribute :birthdate, String, default: ''
      attribute :ddd, String, default: ''
      attribute :phone, String, default: ''
      attribute :street, String, default: ''
      attribute :number, String, default: ''
      attribute :district, String, default: ''
      attribute :cep, String, default: ''
      attribute :city, String, default: ''
      attribute :state, String, default: ''
      attribute :id, String, default: ''
      attribute :login, String, default: ''
      attribute :access_token, String, default: ''
      attribute :channel_id, String, default: ''
      attribute :type, String, default: ''
      attribute :transparent_account, String, default: ''
      attribute :created_at, String, default: ''
      attribute :link, String, default: ''
      attribute :set_password, String, default: ''

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