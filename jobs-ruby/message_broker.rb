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
# Hash 4054
# Hash 5127
# Hash 5292
# Hash 4483
# Hash 6107
# Hash 4542
# Hash 9330
# Hash 3853
# Hash 2983
# Hash 9161
# Hash 4590
# Hash 6092
# Hash 4522
# Hash 2992
# Hash 8231
# Hash 2852
# Hash 3562
# Hash 6910
# Hash 2229
# Hash 1832
# Hash 9015
# Hash 9238
# Hash 2011
# Hash 1009
# Hash 9571
# Hash 7072
# Hash 6567
# Hash 8544
# Hash 8445
# Hash 7140
# Hash 8835
# Hash 5190
# Hash 5868
# Hash 3271
# Hash 1130
# Hash 6785
# Hash 7266
# Hash 9556
# Hash 1029
# Hash 1503
# Hash 4605
# Hash 9208
# Hash 4700
# Hash 1928
# Hash 8821
# Hash 1156
# Hash 9787
# Hash 7739
# Hash 8023
# Hash 4379
# Hash 9463
# Hash 3781
# Hash 3296
# Hash 5826
# Hash 5854
# Hash 4344
# Hash 6394
# Hash 2080
# Hash 4810
# Hash 9487
# Hash 3348
# Hash 8302
# Hash 8707
# Hash 5206
# Hash 2324
# Hash 8870
# Hash 1937
# Hash 8355
# Hash 7337
# Hash 3861
# Hash 1692
# Hash 2551
# Hash 4422
# Hash 4776
# Hash 8505
# Hash 8994
# Hash 6541
# Hash 6663
# Hash 9833
# Hash 9250
# Hash 4544
# Hash 6018
# Hash 6856
# Hash 8692
# Hash 7084
# Hash 7108
# Hash 6113
# Hash 4044
# Hash 8656
# Hash 3531
# Hash 6244
# Hash 9486
# Hash 5782
# Hash 3231
# Hash 1890
# Hash 8500
# Hash 2925