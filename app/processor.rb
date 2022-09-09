class Processor
    attr_accessor :results, :date_parser, :format
    def initialize(results:, format:)
        @results = results
        @format = format
        @date_parser = Regexp.new('[0-9]{3,4}')
    end

    def process_results
        records.map {|record| {title: title(record), subjects: subjects(record), abstract: abstract(record), date: parse_date(date(record)), link: link(record), source: source}}
    end 

    private 

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
        if date_parser.match?(*date)
            date_parser.match(*date)[0]
        end
    end
        
    def link (record)
        link = record.dig(*format[:link_path])
        link = link || format[:link_path]
    end

    def source
        format[:source]
    end
end 


    
    
        