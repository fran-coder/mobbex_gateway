module Mobbex
    module Gateway
        class Subscriber

            MOBBEX_SUBSCRIBER_URL_PART = 'subscriber'

            def initialize(subscription_url_part, id = nil)
                @subscriber_url_part = subscription_url_part + '/' + MOBBEX_SUBSCRIBER_URL_PART
                @subscriber_url_part += "/#{id}" unless id.nil?
            end

            def activate
                getRequest('/action/activate').dispatch
            end

            def create(data)
                getRequest(method: :post).dispatch(data)
            end

            def edit(data)
                getRequest(method: :post).dispatch(data)
            end

            def get
                getRequest.dispatch
            end

            def move(data)
                getRequest('/action/move').dispatch(data)
            end

            def suspend
                getRequest('/action/suspend').dispatch
            end

            def list
                getRequest.dispatch
            end

            private
            def getRequest(url_part = "", method: :get)
                request_url = @subscriber_url_part
                request_url += url_part unless url_part.empty?
                Request.new(request_url, method)
            end

        end
    end
end