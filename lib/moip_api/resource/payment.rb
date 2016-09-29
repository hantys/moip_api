module Moip
  module Resource

    class Payment
      include ActiveData::Model

      attribute :installmentCount, type: String
      attribute :delayCapture, type: String
      attribute :fundingInstrument, type: Object
    end
  end
end