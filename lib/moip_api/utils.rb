module Moip
  class Utils
    def generate_own_id

      o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
      string = (0...65).map { o[rand(o.length)] }.join

      string
    end
  end
end
