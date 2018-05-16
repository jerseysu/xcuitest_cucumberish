# Ruby
require 'gherkin/parser'
require 'gherkin/pickles/compiler'
require 'json'
parser = Gherkin::Parser.new
file = File.new("a.feature", "r")
gherkin_document = parser.parse(file.read)
pickles = Gherkin::Pickles::Compiler.new.compile(gherkin_document)
pickles.each do |a|
#puts JSON.pretty_generate(pickles.first)
puts JSON.pretty_generate(a)
end
