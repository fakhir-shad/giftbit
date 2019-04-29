require 'giftbit-rails/request'

module Giftbit
  class Embedded < Request
    class << self
      def create *args
        params = extract_params args
        fire_post("/embedded", params)
      end
    end
  end
end