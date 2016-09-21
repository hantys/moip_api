module Moip
  module Resource

  # {"errors"=>[{"code"=>"REG-002", "path"=>"v2/accounts", "description"=>"Tax document has already been taken!"}], "additionalInfo"=>{"account"=>{"id"=>"MPA-1CC778A102DF", "email"=>"souripto2r@hotmail.com", "login"=>"souripto2r@hotmail.com"}}}

    class Error < SimpleDelegator
      attr_reader :code, :description, :id, :email, :login

      def initialize(code, description, id, email, login)
        @code, @description, @id, @email, @login = code, description, id, email, login
      end
    end
  end
end