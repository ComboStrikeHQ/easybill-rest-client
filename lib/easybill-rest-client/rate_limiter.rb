require 'redis'
require 'redis-mutex'

module Easybill
  class RateLimiter
    API_LIMIT_PERIOD_SECS = 60
    API_LIMIT_COUNT = 60
    API_LIMIT_REDIS_KEY = 'easybill-api-limit-request-times'
    API_LIMIT_REDIS_MUTEX_KEY = 'easybill-api-limit-mutex'

    def block_if_api_limit_reached
      @redis ||= Redis.new
      RedisClassy.redis ||= redis

      RedisMutex.with_lock(API_LIMIT_REDIS_MUTEX_KEY) do
        if oldest_request_time && time_since_oldest_request < API_LIMIT_PERIOD_SECS
          puts "API limit reached, sleeping #{sleep_time}s"
          sleep sleep_time
        end

        push_current_time_to_request_times
      end
    end

    private

    attr_reader :redis

    def oldest_request_time
      Time.parse(redis.lindex(API_LIMIT_REDIS_KEY, API_LIMIT_COUNT - 1))
    end

    def push_current_time_to_request_times
      redis.lpush(API_LIMIT_REDIS_KEY, Time.now)
      redis.ltrim(API_LIMIT_REDIS_KEY, 0, API_LIMIT_COUNT - 1)
    end

    def time_since_oldest_request
      Time.now - oldest_request_time
    end

    def sleep_time
      (API_LIMIT_PERIOD_SECS - time_since_oldest_request).to_i + 1
    end
  end
end

