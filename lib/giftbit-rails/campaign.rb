require 'giftbit-rails/request'

module Giftbit
  class Campaign < Request
    class << self
      def create *args
        params = extract_params args
        fire_post("/campaign", params)
      end
      def find *args
        params = raise_id_or_uuid_error args
        id = params[:id] || params[:uuid]
        fire_get "/campaign/#{id}", params
      end
    end
  end
end