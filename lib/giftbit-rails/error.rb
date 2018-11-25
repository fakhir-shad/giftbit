module Giftbit
  class Error < StandardError; end
  class TimeoutError < StandardError; end
  class UnprocessableEntity < StandardError; end
  class BadRequest < StandardError; end
  class Unauthorized < StandardError; end
  class Forbidden < StandardError; end
  class CreditCardFailure < StandardError; end
  class TooManyRequests < StandardError; end
  class InternalServiceError < StandardError; end
  class ServiceUnavailable < StandardError; end
end