
# sorts an array of records by the most recent date

class Sorter

    attr_accessor :aggregate_results

    def initialize(aggregate_results)
        @aggregate_results = aggregate_results
    end

    def filter_records_without_date
        aggregate_results.reject { |record| record[:date] }
    end

    def filter_records_with_date
        aggregate_results.select { |record| record[:date] }
    end

    def sort_by_most_recent_date
        filter_records_with_date.sort_by { |record| record[:date] }.reverse
    end

    def results
        sort_by_most_recent_date + filter_records_without_date
    end


end
