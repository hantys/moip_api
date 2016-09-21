module Moip
  module Resource
    # {"id"=>"MPA-D84C264E01B1", "login"=>"souripto4r@hotmail.com", "accessToken"=>"3e89e1430ef941c28a2732c41b6cf895_v2", "channelId"=>"APP-IYDQO7981OKQ", "type"=>"MERCHANT", "transparentAccount"=>false, "email"=>{"address"=>"souripto4r@hotmail.com", "confirmed"=>false}, "person"=>{"name"=>"Pedro", "lastName"=>"Fausto", "birthDate"=>"1982-12-28", "taxDocument"=>{"type"=>"CPF", "number"=>"743.845.930-66"}, "address"=>{"street"=>"rua epitacio pessoa", "streetNumber"=>"1240", "district"=>"lourival", "zipcode"=>"64023400", "zipCode"=>"64023400", "city"=>"teresina", "state"=>"PI", "country"=>"BRA"}, "phone"=>{"countryCode"=>"55", "areaCode"=>"86", "number"=>"994211487"}}, "createdAt"=>"2016-09-21T12:55:49.120Z", "_links"=>{"self"=>{"href"=>"https://sandbox.moip.com.br/moipaccounts/MPA-D84C264E01B1", "title"=>nil}, "setPassword"=>{"href"=>"https://desenvolvedor.moip.com.br/sandbox/AskForNewPassword.do?method=confirm&email=souripto4r%40hotmail.com&code=b87beb7528030ceb51f9c001d3b85fa5"}}}
    class User < SimpleDelegator
      attr_accessor :email, :name, :cpf, :birthdate, :ddd, :phone, :street, :number, :district, :cep, :city, :state

      attr_accessor :id, :login, :accessToken, :channelId, :type, :transparent_account, :created_at, :link, :set_password

      def initialize(email, name, cpf, birthdate, ddd, phone, street, number, district, cep, city, state, id = nil, login = nil, accessToken = nil, channelId = nil, type = nil, transparent_account = nil, created_at = nil, link = nil, set_password = nil)
        @email, @name, @cpf, @birthdate, @ddd, @phone, @street, @number, @district, @cep, @city, @state, @id, @login, @accessToken, @channelId, @type, @transparent_account, @created_at, @link, @set_password = email, name, cpf, birthdate, ddd, phone, street, number, district, cep, city, state, id, login, accessToken, channelId, type, transparent_account, created_at, link, set_password
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
              "birthDate": Date.parse(@birthdate).to_s,
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