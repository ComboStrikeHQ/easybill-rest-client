# frozen_string_literal: true
module EasybillRestClient
  class LogFormatter
    def initialize(request_id:)
      @formatter = Logger::Formatter.new
      @request_id = request_id
    end

    def call(severity, datetime, progname, msg)
      formatter.call(severity, datetime, progname, format_message(msg))
    end

    private

    attr_reader :request_id, :formatter

    def format_message(msg)
      "[easybill-rest-client] RequestId=#{request_id} #{msg}"
    end
  end
end
