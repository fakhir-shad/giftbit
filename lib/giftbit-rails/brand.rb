require 'giftbit-rails/request'

module Giftbit
  class Brand < Request
    class << self
      def all *args
        params = extract_params args
        fire_get("/brands", params)
      end
      def find *args
        params = raise_id_error args
        fire_get "/brands/#{params[:id]}", params
      end
    end
  end
end