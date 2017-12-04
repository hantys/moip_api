module Moip
  module Resource
    class Escrow
      include ActiveData::Model

      attribute :description, type: String
    end
  end
end