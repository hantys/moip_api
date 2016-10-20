module Moip
  class RStruct
    # @author Shiva Bhusal
    # @blog cbabhusal.wordpress.com
    # Recursive OpenStruct
    # #
    def self.new(object)
      if object.is_a?(Hash)
        object = object.clone
        object.each do |key, value|
          new_value = value.to_hash.with_indifferent_access rescue value
          object[key] = new(new_value)
        end
        OpenStruct.new(object)
      elsif object.is_a?(Array)
        object.map do |item|
          new(item)
        end
      else
        object
      end
    end
  end
end
