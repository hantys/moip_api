module Moip
  module Resource
    class Billet
      include ActiveData::Model

      attribute :expirationDate, type: String
      attribute :instrunction_lines, type: Hash
      attribute :logo_uri, type: String
    end
  end
end
