require 'giftbit-rails/request'

module Giftbit
  class Marketplace < Request
    def self.all
      fire_get "/marketplace", {}
    end
  end
end