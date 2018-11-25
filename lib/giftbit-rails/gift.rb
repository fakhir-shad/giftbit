require 'giftbit-rails/request'

module Giftbit
  class Gift < Request
    class << self
      def all *args
        params = extract_params args
        fire_get "/gifts", params
      end
      def find *args
        params = raise_uuid_error args
        fire_get "/gifts/#{uuid}", params
      end
      def resend *args
        params = raise_uuid_error args
        (raise argument_error "resend") if params[:resend].blank?
        fire_put "/gifts/#{uuid}", params
      end
      def cancel *args
        raise_uuid_error args
        fire_delete "/gifts/#{uuid}", {}
      end
    end
  end
end