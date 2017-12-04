module Moip
  module Resource

    class Payment
      include ActiveData::Model

      attribute :installmentCount, type: String
      attribute :escrow, type: Object
      attribute :delayCapture, type: String
      attribute :fundingInstrument, type: Object
    end
  end
end