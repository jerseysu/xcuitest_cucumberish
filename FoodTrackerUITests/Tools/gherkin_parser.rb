# Ruby
require 'gherkin/parser'
require 'gherkin/pickles/compiler'
require 'json'
parser = Gherkin::Parser.new
file = File.new("../Features/food.feature", "r")
gherkin_document = parser.parse(file.read)
pickles = Gherkin::Pickles::Compiler.new.compile(gherkin_document)
pickles.each do |scenarios|
puts JSON.pretty_generate(scenarios)
end
