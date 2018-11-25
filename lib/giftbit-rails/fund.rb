require 'giftbit-rails/request'

module Giftbit
  class Fund < Request
    class << self
      def all *args
        params = extract_params args
        fire_get "/funds", params
      end
      def create *args
        params = extract_params args
        fire_post "/funds", params
      end
    end
  end
end