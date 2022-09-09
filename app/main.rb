require "./search"
require "./processor"

colendaResponse = Search.new("https://colenda.library.upenn.edu/?utf8=%E2%9C%93&search_field=all_fields&format=json&q=").results
colendaProcessor = Processor.new(results: colendaResponse, format: {
  records_path: ["response", "docs"],
  title_path: ["title_tesim"],
  subjects_path: ["subject_tesim"],
  abstract_path: ["abstract_tesim"],
  date_path: ["date_tesim"],
  link_path: "colenda",
  source: "Colenda"
}).process_results

p colendaProcessor