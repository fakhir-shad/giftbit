require 'giftbit-rails/request'

module Giftbit
  class Ping < Request
    def self.ping
      fire_get "/ping", {}
    end
  end
end