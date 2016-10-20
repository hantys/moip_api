module Moip
  module Resource
    class Webhook
      include ActiveData::Model

      attribute :resourceId, type: String
      attribute :event, type: String
    end
  end
end
