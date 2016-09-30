module Moip
  module Resource
    module Account

      # TODO: Create object by method
      class Base
        include ActiveData::Model

        attribute :email, type: Hash
        attribute :person, type: Object
        attribute :type, type: String

        # Atributos nao nesecessarios (http://dev.moip.com.br/referencia-api/#criar-conta-moip-post
        #
        # attribute :company, type: Hash
        # attribute :business_assignment, type: Hash
        # attribute :business_assignment, type: Hash
      end

      class Person
        include ActiveData::Model

        attribute :name, type: String
        attribute :lastName, type: String
        attribute :birthDate, type: String
        attribute :taxDocument, type: Hash
        attribute :identityDocument, type: Hash
        attribute :phone, type: Hash
        attribute :address, type: Object
      end

    end
  end
end