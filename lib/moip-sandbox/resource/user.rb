module Moip
  module Resource
    # {"id"=>"MPA-D84C264E01B1", "login"=>"souripto4r@hotmail.com", "accessToken"=>"3e89e1430ef941c28a2732c41b6cf895_v2", "channelId"=>"APP-IYDQO7981OKQ", "type"=>"MERCHANT", "transparentAccount"=>false, "email"=>{"address"=>"souripto4r@hotmail.com", "confirmed"=>false}, "person"=>{"name"=>"Pedro", "lastName"=>"Fausto", "birthDate"=>"1982-12-28", "taxDocument"=>{"type"=>"CPF", "number"=>"743.845.930-66"}, "address"=>{"street"=>"rua epitacio pessoa", "streetNumber"=>"1240", "district"=>"lourival", "zipcode"=>"64023400", "zipCode"=>"64023400", "city"=>"teresina", "state"=>"PI", "country"=>"BRA"}, "phone"=>{"countryCode"=>"55", "areaCode"=>"86", "number"=>"994211487"}}, "createdAt"=>"2016-09-21T12:55:49.120Z", "_links"=>{"self"=>{"href"=>"https://sandbox.moip.com.br/moipaccounts/MPA-D84C264E01B1", "title"=>nil}, "setPassword"=>{"href"=>"https://desenvolvedor.moip.com.br/sandbox/AskForNewPassword.do?method=confirm&email=souripto4r%40hotmail.com&code=b87beb7528030ceb51f9c001d3b85fa5"}}}
    class User
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

      validates :email, :name, :cpf, presence: true

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