class Definition
  attr_reader :id, :word_id
  attr_accessor :definition
  @@definitions = {}
  @@total_rows = 0
  def initialize(definition, word_id, id)
    @definition = definition
    @word_id = word_id
    @id = id || @@total_rows += 1
    @@definitions[self.id] = self
  end


  def self.all
    @@definitions.values()
  end

  def self.clear
    @@definitions = {}
  end

  def self.search(id)
    @@definitions.fetch(id)
  end

  def delete
    @@definitions.delete(@id)
  end

  def word
    Word.search(@word_id)
  end

  def self.all_id
    @@definitions.keys
  end




end
