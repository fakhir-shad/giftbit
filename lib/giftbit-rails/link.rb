require 'giftbit-rails/request'

module Giftbit
  class Link < Request
    def self.find *args
      params = raise_id_or_uuid_error args
      id = params[:id] || params[:uuid]
      fire_get "/links/#{id}", params
    end
  end
end