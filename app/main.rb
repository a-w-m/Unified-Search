require "./search"
require "./processor"
require "./aggregator"
require "./sorter"
require "./response"
require "json"


colenda_search = Search.new("https://colenda.library.upenn.edu/?utf8=%E2%9C%93&search_field=all_fields&format=json&q=")
finding_aids_search = Search.new("https://findingaids.library.upenn.edu/records?f[record_source][]=upenn&format=json&q=")


colendaProcessor = Processor.new(search: colenda_search, format: {
  records_path: ["response", "docs"],
  title_path: ["title_tesim"],
  subjects_path: ["subject_tesim"],
  abstract_path: ["abstract_tesim"],
  date_path: ["date_tesim"],
  link: "https://colenda.library.upenn.edu/catalog/",
  source: "Colenda"
})

findingAidsProcessor = Processor.new(search: finding_aids_search, format: {
    records_path: ["data"],
    title_path: ["attributes", "title_tsi", "attributes", "value"],
    subjects_path: ["attributes", "subjects_ssim", "attributes", "value"],
    abstract_path: ["attributes", "abstract_scope_contents_tsi", "attributes", "value"],
    date_path: ["attributes", "display_date_ssim", "attributes", "value"],
    link_path: ["links", "self"],
    source: "Finding Aids"
  })


aggregator = Aggregator.new(colenda_processor: colendaProcessor, finding_aids_processor: findingAidsProcessor)
sorter = Sorter.new(aggregator: aggregator)
response = Response.new(sorter: sorter)

response.display
