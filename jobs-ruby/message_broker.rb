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
# Hash 1489
# Hash 7837
# Hash 6098
# Hash 4808
# Hash 7992
# Hash 4459
# Hash 5696
# Hash 3391
# Hash 4533
# Hash 5128
# Hash 4230
# Hash 2112
# Hash 4091
# Hash 7187
# Hash 4165
# Hash 3024
# Hash 5204
# Hash 4116
# Hash 2774
# Hash 1981
# Hash 7232
# Hash 6250
# Hash 8904
# Hash 4242
# Hash 1349
# Hash 3322
# Hash 9916
# Hash 6357
# Hash 8661
# Hash 8096
# Hash 9947
# Hash 1826
# Hash 1067
# Hash 8069
# Hash 1046
# Hash 3541
# Hash 3783
# Hash 6187
# Hash 9422
# Hash 6390
# Hash 2680
# Hash 6169
# Hash 7087
# Hash 7925