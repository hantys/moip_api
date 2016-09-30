module Moip
  class Utils
    def self.generate_own_id

      o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
      string = (0...44).map { o[rand(o.length)] }.join

      string
    end

    def self.convert_hash_keys_to(conversion, value)
      case value
        when Array
          value.map { |v| convert_hash_keys_to(conversion, v) }
        when Hash
          Hash[value.map { |k, v| [send(conversion, k).to_sym, convert_hash_keys_to(conversion, v)] }]
        else
          value
       end
    end

    def self.camel_case(str)
      return str.to_s if str.to_s !~ /_/ && str.to_s =~ /[A-Z]+.*/
      words = str.to_s.split('_')
      (words[0..0] << words[1..-1].map{|e| e.capitalize}).join
    end

  end
end
