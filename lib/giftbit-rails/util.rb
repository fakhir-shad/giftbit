module Giftbit
  module Util
    def argument_error(name)
      name ? ArgumentError.new("#{name} is required!") : ArgumentError.new
    end

    def extract_params(args)
      args.last.is_a?(::Hash) ? args.pop.with_indifferent_access : {}
    end

    def raise_uuid_error args
      params = extract_params(args)
      argument_error "uuid" if params[:uuid].blank?
      params
    end

    def raise_id_error args
      params = extract_params(args)
      argument_error "id" if params[:id].blank?
      params
    end

    def raise_id_or_uuid_error args
      params = extract_params(args)
      id = params[:id] || params[:uuid]
      argument_error "id or uuid" if id.blank?
      params
    end

    def extract_errors response
      parsed_response = response.parsed_response
      raise Giftbit::BadRequest.new(parsed_response) if response.code == 400
      raise Giftbit::Unauthorized.new(parsed_response) if response.code == 401
      raise Giftbit::CreditCardFailure.new(parsed_response) if response.code == 402
      raise Giftbit::Forbidden.new(parsed_response) if response.code == 403
      raise Giftbit::UnprocessableEntity.new(parsed_response) if response.code == 422
      raise Giftbit::TooManyRequests.new(parsed_response) if response.code == 429
      raise Giftbit::InternalServiceError.new(parsed_response) if response.code == 500
      raise Giftbit::ServiceUnavailable.new(parsed_response) if response.code == 503
      parsed_response
    end
  end
end