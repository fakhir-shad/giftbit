require 'giftbit-rails/request'

module Giftbit
  class Region < Request
    def self.all *args
      params = extract_params args
      fire_get "/regions", params
    end
  end
end