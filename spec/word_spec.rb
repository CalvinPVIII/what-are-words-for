require('rspec')
require('word')

describe '#Word' do
  before(:each)do
  Word.clear
end
describe(".all") do
it("should return all words stored in the hash")do
word = Word.new("First", nil)
word2 = Word.new("Second", nil)
  expect(Word.all).to(eq([word, word2]))
end
end

describe(".clear") do
it("should clear all words stored in the hash")do
word = Word.new("First", nil)
word2 = Word.new("Second", nil)
Word.clear
  expect(Word.all).to(eq([]))
end
end

describe(".search") do
it("should return for a specific word based on id")do
word = Word.new("First", nil)
word2 = Word.new("Second", nil)
expect(Word.search(15)).to(eq(word))
end
end

describe("#delete") do
it("should delete a specific word based on id")do
word = Word.new("First", nil)
word2 = Word.new("Second", nil)
word.delete
expect(Word.all).to(eq([word2]))
end
end

describe("#definition") do
it("should return the definition of the word")do
word = Word.new("First", nil)
definition = Definition.new("The initial thing", word.id, nil)
expect(word.definition).to(eq(definition))
end
end





end
