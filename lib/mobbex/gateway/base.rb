module Mobbex
    module Gateway
      class Base

        def initialize
        end

        # get the list of suscriptions
        #
        # return: Response object
        def get_subscriptions
            Subscription.new.list
        end

        # get subscription
        #
        # param: subscription id
        #
        # return: Response object
        def get_subscription(id)
          # Subscription.new.get(id)
          Subscription.new(id).get
        end

        # create subscription
        #
        # param: data
        #
        # return: Response object
        def create_subscription(data)
          Subscription.new.create(data)
        end

        # edit subscription
        #
        # param: subscription id to update
        # param: data
        #
        # return: Response object
        def edit_subscription(id, data)
          # Subscription.new.edit(id, data)
          Subscription.new(id).edit(data)
        end

        # activate subscription
        #
        # params: subscription id
        #
        # return: Response object
        def activate_subscription(id)
#          Subscription.new.activate(id)
            #Subscription.new.change_state(id, true)
          Subscription.new(id).change_state(true)
        end
        
        # deactivate subscription
        #
        # params: subscription id
        #
        # return: Response object
        def deactivate_subscription(id)
          # Subscription.new.deactivate(id)
          #Subscription.new.change_state(id, false)
          Subscription.new(id).change_state(false)
        end

        # get the list of subscribers of a subscription
        #
        # param sid : subcription id
        # 
        # return: Response object
        def get_subscribers(subscription_id)
          Subscription.new(subscription_id).getSubscriber.list
        end

        # activate subscriber
        #
        # param subscription_id : subcription id
        # param subcriber_id: id of the subscriber to activate
        # 
        # return: Response object
        def activate_subscriber(subscription_id, subscriber_id)
          Subscription.new(subscription_id).getSubscriber(subscriber_id).activate
        end

        # create subscriber
        #
        # param subscription_id : subcription id
        # param data : data of the subscriber
        # 
        # return: Response object
        def create_subscriber(subscription_id, data)
          Subscription.new(subscription_id).getSubscriber.create(data)
        end

        # edit subscriber
        #
        # param subscription_id : subcription id
        # param subcriber_id: id of the subscriber to edit
        # param data : data to change
        # 
        # return: Response object
        def edit_subscriber(subscription_id, subscriber_id, data)
          Subscription.new(subscription_id).getSubscriber(subscriber_id).create(data)
        end

        # get the subscriber
        #
        # param subscription_id : subcription id
        # param subscriber_id : subscriber id
        # 
        # return: Response object
        def get_subscriber(subscription_id, subscriber_id)
          Subscription.new(subscription_id).getSubscriber(subscriber_id).get
        end

        # move subscriber
        #
        # param subscription_id : subcription id
        # param subcriber_id: id of the subscriber to edit
        # param data : data of the new subscription
        # 
        # return: Response object
        def move_subscriber(subscription_id, subscriber_id, data)
          Subscription.new(subscription_id).getSubscriber(subscriber_id).move(data)
        end

        # suspend subscriber
        #
        # param subscription_id : subcription id
        # param subcriber_id: id of the subscriber to activate
        # 
        # return: Response object
        def suspend_subscriber(subscription_id, subscriber_id)
          Subscription.new(subscription_id).getSubscriber(subscriber_id).suspend
        end

      end
    end
end
