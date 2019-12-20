require('rspec')
require('word')

describe '#Word' do
  before(:each)do

end
describe(".all") do
it("should return all words stored in the hash")do
word = Word.new("First")
word2 = Word.new("Second")
  expect(Word.all).to(eq([word, word2]))
end
end

#   describe("#word") do
#   it("should create a word and store it in the words hash")do
#   word = Word.new("Test")
#     expect().to(eq())
#   end
# end




end
