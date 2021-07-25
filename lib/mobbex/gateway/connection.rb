require 'net/http'

module Mobbex
    module Gateway
        class Connection

            def initialize(uri)
                @connection = Net::HTTP.new(uri.host, uri.port)
                @connection.use_ssl = true
                @connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
            end

            def dispatch(request)
                
                begin
                    Response.new(@connection.start {|http|
                        http.request(request)
                    })
                rescue
                    Net::HTTPFatalError.new("Send Request Error", nil)
                end
            end

        end
    end
end
