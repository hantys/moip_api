module Moip
  module Resource

    class User < SimpleDelegator
      attr_reader :email, :name, :cpf, :birthdate, :ddd, :phone, :street, :number, :district, :cep, :city, :state

      def initialize(email, name, cpf, birthdate, ddd, phone, street, number, district, cep, city, state)
        @email, @name, @cpf, @birthdate, @ddd, @phone, @street, @number, @district, @cep, @city, @state = email, name, cpf, birthdate, ddd, phone, street, number, district, cep, city, state
      end

      def get_json
        data = {
          "email": {
              "address": @email
          },
          "person": {
              "name": @name,
              "lastName": " ",
              "taxDocument": {
                  "type": "CPF",
                  "number": @cpf
              },
              "birthDate": @birthdate,
              "phone": {
                  "countryCode": "55",
                  "areaCode": @ddd,
                  "number": @phone
              },
              "address": {
                  "street": @street,
                  "streetNumber": @number,
                  "district": @district,
                  "zipCode": @cep,
                  "city": @city,
                  "state": @state,
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