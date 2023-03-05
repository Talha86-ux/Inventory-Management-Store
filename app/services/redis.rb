require 'redis'

class RedisClient
  def initialize
    @redis = Redis.new(host: 'localhost', port: 6379)
  end

#   def set(key, value)
#     @redis.set(key, value)
#   end

#   def get(key)
#     @redis.get(key)
#   end
end
