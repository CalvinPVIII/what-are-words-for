class Word
attr_reader :id
attr_accessor :word

@@words = {}
@@total_rows = 0

  def initialize(word, id)
    @word = word
    @id = id || @@total_rows += 1
    @@words[self.id] = self

  end

  def self.all
    @@words.values()
  end

  def self.clear
    
  end




end
