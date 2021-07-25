module Mobbex
    module Gateway
        class Subscription

            MOBBEX_SUBSCRIPTION_URL_PART = 'subscriptions'

            def initialize(id = nil)
                @subscription_id = id
                @subscription_url_part = MOBBEX_SUBSCRIPTION_URL_PART
                @subscription_url_part += "/#{id}" unless id.nil?
            end

            def activate #(id)
                #Request.new("#{SUBSCRIPTION_URL_PART}/#{id}/action/activate", :get).dispatch
                getRequest("/action/activate", :get).dispatch
            end

            def change_state(state) #(id, state)
                action = state ? 'activate' : 'delete'
                # Request.new("#{SUBSCRIPTION_URL_PART}/#{id}/action/#{action}", :get).dispatch
                getRequest("/action/#{action}", :get).dispatch
            end

            def create(data)
                # Request.new(SUBSCRIPTION_URL_PART, :post).dispatch(data)
                getRequest(:post).dispatch(data)
            end

            def deactivate #(id)
                # Request.new("#{SUBSCRIPTION_URL_PART}/#{id}/action/delete", :get).dispatch
                getRequest("/action/delete", :get).dispatch
            end

            def edit(data) #(id, data)
                # Request.new("#{SUBSCRIPTION_URL_PART}/#{id}", :post).dispatch(data)
                Request(:post).dispatch(data)
            end

            def get #(id)
                # Request.new("#{SUBSCRIPTION_URL_PART}/#{id}", :get).dispatch
                getRequest(:get).dispatch
            end

            def list
                # Request.new(SUBSCRIPTION_URL_PART, :get).dispatch
                getRequest(:get).dispatch
            end

            def getSubscriber(subscriber_id = nil)
                raise('Invalid Subscription') if @subscription_id.nil?
                
                Subscriber.new(@subscription_url_part, subscriber_id)
            end

            private
            def getRequest(url_part = "", method)
                request_url = @subscription_url_part
                request_url += url_part unless url_part.empty?
                Request.new(request_url, method)
            end

        end
    end
end
