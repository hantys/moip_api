module Moip
  class Utils
    def self.generate_own_id

      o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
      string = (0...44).map { o[rand(o.length)] }.join

      string
    end
  end
end
