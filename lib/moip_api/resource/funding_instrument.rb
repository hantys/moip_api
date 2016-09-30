module Moip
  module Resource
    class FundingInstrument
      include ActiveData::Model

      attribute :creditCard, type: Object
      attribute :method, type: String
      # attribute :boleto
      # attribute :onlineBankDebit
    end
  end
end
