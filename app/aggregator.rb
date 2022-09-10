
# concatenates the processed search results from both sources

class Aggregator
    attr_accessor :colenda_processed_results, :finding_aids_processed_results
    def initialize(colenda:, findingaids:)
        @colenda_processed_results = colenda
        @finding_aids_processed_results =  findingaids
    end 

    def results
        colenda_processed_results + finding_aids_processed_results
    end

end