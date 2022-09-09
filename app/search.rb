require 'net/http'
require 'json'

# Search requests a resource from an endpoint and provides the body of the response 

class Search

    attr_accessor :endpoint, :query_parameter

    def initialize(endpoint)
        @endpoint = endpoint
        @query_parameter = ARGV.join(" ").strip
    end 


    def results
        parse_body(response_body)
    end

    private 

    def query
        URI(endpoint + query_parameter)
    end 

    def response
        Net::HTTP.get_response(query)
    end

    def response_body
        response.body 
    end

    def parse_body(response_body)
        JSON.parse(response_body)
    end

end



