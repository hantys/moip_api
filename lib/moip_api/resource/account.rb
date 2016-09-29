module Moip
  module Resource
    module Account
      def self.new(args)
        Base.new(args)
      end

      # TODO: Create object by method
      class Base
        include ActiveData::Model

        attribute :email, type: Hash
        attribute :person, type: Hash
        attribute :site, type: String
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
        attribute :last_name, type: String
        attribute :birth_date, type: String
        attribute :tax_document, type: Hash
        attribute :identity_document, type: Hash
        attribute :nationality, type: Hash
        attribute :phone, type: Hash
        attribute :address, type: Object
      end

    end
  end
end