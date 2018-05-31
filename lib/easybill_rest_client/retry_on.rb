# frozen_string_literal: true

require 'retryable'

module EasybillRestClient
  class RetryOn
    def initialize(logger, tries, retry_cool_off_time)
      @logger = logger
      @tries = tries
      @retry_cool_off_time = retry_cool_off_time
    end

    def retry_on(klass, &block)
      Retryable.retryable(retryable_opts(klass), &block)
    end

    private

    attr_reader :logger, :tries, :retry_cool_off_time

    def retryable_opts(klass)
      {
        EasybillRestClient::TooManyRequests => {
          tries: tries,
          sleep: retry_cool_off_time,
          on: klass,
          exception_cb: method(:log_too_many_requests)
        },
        Net::OpenTimeout => {
          tries: tries,
          sleep: 0,
          on: klass,
          exception_cb: method(:log_open_timeout)
        }
      }.fetch(klass)
    end

    def log_open_timeout(_exception)
      logger.warn("Unable to open connection after #{Request::OPEN_TIMEOUT}s, retrying...")
    end

    def log_too_many_requests(_exception)
      logger.warn('Too many requests!')
    end
  end
end
