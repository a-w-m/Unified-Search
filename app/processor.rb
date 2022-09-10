
# generates an array of records with the required fields

class Processor
    attr_accessor :results, :date_parser, :format
    def initialize(search:, format:)
        @results = search.results
        @format = format
        @date_parser = Regexp.new('[0-9]{3,4}')
    end

    def process_results
        records.map {|record| {title: title(record), subjects: subjects(record), abstract: abstract(record), date: parse_date(date(record)), link: link(record), source: source}}
    end 

    private 

    # retrieve the values from the record using array of keys in each field of the format hash

    # challenge: currently returing the value from the original record which results 
    # in inconsistent data types/classes, i.e. title is an Array in colenda, but a string in finding aids

    # challenge: Processor losing single responsibility by both digging the response for values and processing the results
    # there is an opportunity to create a new class that solely responds to messages requesting to dig  

    def records
        results.dig(*format[:records_path])
    end 

    def title(record)
        record.dig(*format[:title_path])
    end 

    def subjects(record)
        record.dig(*format[:subjects_path])
    end
    
    def abstract(record)
        record.dig(*format[:abstract_path])
    end

    def date (record)
        record.dig(*format[:date_path])
    end
    
    def parse_date(date) 
        
        unless date.nil?
            
            if date.is_a? Array
                date = date.first
            end 

            if date_parser.match?(date)
                date_parser.match(date)[0]
            end
        end

       
    end
        
    def link (record)

        # challenge: lose abstraction here handling a field (link) not in the Colenda response 

        if format[:source] == "Colenda"
            link = "https://colenda.library.upenn.edu/catalog/#{record["id"]}"
            return link      
        end

        link = record.dig(*format[:link_path])
        link = link || format[:link_path]
    end

    def source
        format[:source]
    end
end 


    
    
        