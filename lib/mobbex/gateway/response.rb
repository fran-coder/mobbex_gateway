require 'json'

module Mobbex
    module Gateway
        class Response

            def initialize(response)

                @result = false
                @code = "Success"
                @error = "No error"
                @data = {}
                @response = response

                case response
                    when Net::HTTPSuccess, Net::HTTPRedirection
                        mobbex_response = response.body
                        mobbex_response_json = JSON.parse(mobbex_response)
                        @result = mobbex_response_json['result']
                        if @result
                            @data = mobbex_response_json['data']
                        else 
                            @code = mobbex_response_json['code']
                            @error = mobbex_response_json['error']
                        end
                    when Net::HTTPUnauthorized
                        @code = 'Unauthorized'
                        @error = "Unauthorized"
                    when Net::HTTPFatalError
                        @code = 'Fatal Error'
                        @error = 'Fatal Error'
                    when NilClass
                        @code = 'Nill Class'
                        @error = "No response received"
                    else
                        @code = 'Unkown'
                        @error = "Unprocess error : (#{response.class})"   
                end

            end

            # Return full response
            #
            def get
                @response
            end

            # Return full boby
            #
            def body
                @body
            end
        
            # Return result flag
            #
            def result
                @result
            end

            # Return code
            #
            def code
                @code
            end

            # Return error is exists
            #
            def error
                @error
            end
        
            # Return data as json
            #
            def data
                @data
            end
            
        end
    end
end
