require "uri"
require 'net/http'

module Mobbex
    module Gateway
        class Request

            MOBBEX_API_URL = "https://api.mobbex.com/p/" 

            @connection
            @request

            def initialize(url_part, method) #, data = {})

                # create uri
                uri = URI("#{MOBBEX_API_URL}#{url_part}")

                # create connection
                @connection = Connection.new(uri)

                # create request
                @request = create(uri, method)

            end

            def dispatch(data = {})
                init(data)                
                @connection.dispatch(@request)
            end

        private

            def create(uri, method)
                case method
                when :get
                    Net::HTTP::Get.new(uri)
                when :post
                    Net::HTTP::Post.new(uri)
                else
                    raise("Invalid HTTP Method")
                end
            end

            def init(data)
                add_headers
                set_body(data)
            end

            def add_headers

                @request['cache-control'] = 'no-cache'
                @request['Content-Type'] = 'application/json'
                @request['x-lang'] = 'es'

                # these parameters are getted from configuration
                @request['x-access-token'] = Mobbex::Gateway.x_access_token
                @request['x-api-key'] = Mobbex::Gateway.x_api_key

            end

            def set_body(parameters = {})
                 #@request.set_form_data(parameters) unless parameters.empty?
                 @request.body = parameters.to_json unless parameters.empty?
            end

        end

    end
end
