require "json"

class Response
    attr_accessor :sorter
    def initialize(sorter:)
        @sorter = sorter
    end

    def get
        sorter.results.to_json
    end


    def display
        puts get
    end
end
