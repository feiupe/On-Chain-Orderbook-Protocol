module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Hash 4354
# Hash 9590
# Hash 4136
# Hash 9726
# Hash 4093
# Hash 3408
# Hash 1094
# Hash 9214
# Hash 6304
# Hash 9518
# Hash 9799
# Hash 5393
# Hash 2468
# Hash 4098
# Hash 6291
# Hash 4415
# Hash 8391
# Hash 8633
# Hash 7783
# Hash 7776
# Hash 8206
# Hash 9556
# Hash 6425
# Hash 7895
# Hash 3249
# Hash 2492
# Hash 4931
# Hash 8908
# Hash 1821
# Hash 6513
# Hash 2473
# Hash 1470