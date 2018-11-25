require 'httparty'
require 'giftbit-rails/util'

module Giftbit
  class Request

    include HTTParty

    def initialize key, url
      raise self.argument_error("api_key and api_url") if key.blank? || url.blank?
      self.class.base_uri url
      self.class.headers({'Content-Type' => 'application/json', 'Authorization' => "Bearer #{key}"})
    end

    class << self
      include Util

      %w(fire_get fire_delete).each do |fire|
        define_method(fire) do |url, args|
          cater_exception fire, url, args, true
        end
      end

      %w(fire_post fire_put).each do |fire|
        define_method fire do |url, args|
          cater_exception fire, url, args, false
        end
      end

      private

        def cater_exception fire, url, args, query
          begin
            args.reject!{ |arg| arg['id'] || arg['uuid'] }
            params = query ? {query: args} : {body: args.to_json}
            response = send(fire.split('_')[1], url, params)
            extract_errors response
          rescue Net::OpenTimeout, Net::ReadTimeout, Timeout::Error => e
            raise ::Giftbit::TimeoutError.new(e.message)
          end
        end
    end
  end
end