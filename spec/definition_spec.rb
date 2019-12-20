require('rspec')
require('definition')

describe '#Definition' do
  before(:each)do
  Definition.clear
  Word.clear
end
describe(".all") do
it("should return all definitions stored in the hash")do
word = Word.new("First", nil)
word2 = Word.new("Second", nil)
definition = Definition.new("The initial thing", word.id, nil)
definition2 = Definition.new("The following thing", word2.id, nil)
  expect(Definition.all).to(eq([definition, definition2]))
end
end

describe(".clear") do
it("should clear all definitions stored in the hash")do
word = Word.new("First", nil)
word2 = Word.new("Second", nil)
definition = Definition.new("The initial thing", word.id, nil)
definition2 = Definition.new("The following thing", word2.id, nil)
Definition.clear
  expect(Definition.all).to(eq([]))
end
end

describe(".search") do
it("should return for a specific definition based on id")do
word = Word.new("First", nil)
word2 = Word.new("Second", nil)
definition = Definition.new("The initial thing", word.id, nil)
definition2 = Definition.new("The following thing", word2.id, nil)
expect(Definition.search(5)).to(eq(definition))
end
end


describe("#word") do
it("should return the word that is being defined")do
word = Word.new("First", nil)
definition = Definition.new("The initial thing", word.id, nil)
expect(definition.word).to(eq(word))
end
end


describe("#delete") do
it("should delete a specific definition based on id")do
word = Word.new("First", nil)
word2 = Word.new("Second", nil)
definition = Definition.new("The initial thing", word.id, nil)
definition2 = Definition.new("The following thing", word2.id, nil)
definition.delete
expect(Definition.all).to(eq([definition2]))
end
end





end
