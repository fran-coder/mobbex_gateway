# required files

module Mobbex
    module Gateway

        autoload :Base, "mobbex/gateway/base"
        autoload :Connection, "mobbex/gateway/connection"
        autoload :Request, "mobbex/gateway/request"
        autoload :Response, "mobbex/gateway/response"
        autoload :Subscription, "mobbex/gateway/subscription"
        autoload :Subscriber, "mobbex/gateway/subscriber"

        class << self

            # Set Mobbex Api Key of the application.
            #
            attr_accessor :x_api_key

            # Set Mobbex Access token of the entity.
            #
            attr_accessor :x_access_token

        end

        def self.new
            Base.new
        end

        def self.configure(&block)
            yield Mobbex::Gateway
        end

        def self.version
          '1.0.0'
        end

    end
end
