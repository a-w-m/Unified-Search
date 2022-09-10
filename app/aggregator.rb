
# concatenates the processed search results from both sources

class Aggregator
    attr_accessor :colenda_processed_results, :finding_aids_processed_results
    def initialize(colenda_processor:, finding_aids_processor:)
        @colenda_processed_results = colenda_processor.process_results
        @finding_aids_processed_results =  finding_aids_processor.process_results
    end 

    def results
        colenda_processed_results + finding_aids_processed_results
    end

end