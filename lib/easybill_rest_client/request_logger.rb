# frozen_string_literal: true
module EasybillRestClient
  class RequestLogger
    def initialize(logger:, request_id:)
      @logger = logger
      @request_id = request_id
    end

    %i(info warn error).each do |method|
      define_method(method) do |msg|
        logger.public_send(method, format_message(msg))
      end
    end

    private

    attr_reader :request_id, :logger

    def format_message(msg)
      "[easybill-rest-client] RequestId=#{request_id} #{msg}"
    end
  end
end
