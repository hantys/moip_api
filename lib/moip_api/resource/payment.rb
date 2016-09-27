module Moip
  module Resource

    class Payment
      include ActiveData::Model

      attribute :email, String
      attribute :name, String
      attribute :cpf, String
      attribute :birthdate, String
      attribute :ddd, String
      attribute :phone, String
      attribute :street, String
      attribute :number, String
      attribute :district, String
      attribute :cep, String
      attribute :city, String
      attribute :state, String
      attribute :id, String
      attribute :login, String
      attribute :access_token, String
      attribute :channel_id, String
      attribute :type, String
      attribute :transparent_account, String
      attribute :created_at, String
      attribute :link, String
      attribute :set_password, String

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