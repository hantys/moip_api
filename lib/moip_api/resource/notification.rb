module Moip
  module Resource
    class Notification
      include ActiveData::Model

      attribute :events, type: Array
      attribute :target, type: String
      attribute :media, type: String

    end
  end
end
