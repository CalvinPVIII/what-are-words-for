require('sinatra')
require('sinatra/reloader')
require('./lib/definition')
require('pry')
require('./lib/word')
also_reload('lib/**/*.rb')


get ("/")do
  @words = Word.all
  erb(:main)
end

get ("/words")do
  redirect to('/')
end

get ("/words/new")do
  @words = Word.all
  erb(:new_word)
end

post("/words") do
  word = Word.new(params[:word],nil)
  redirect to('/')
end

get ("/words/:id")do
  @word = Word.search(params[:id].to_i)
  @definitions = Definition.all
  @keys = Definition.all_id
  binding.pry
  erb(:word)
end

get ("/words/:id/definitions/new")do
  @word = Word.search(params[:id].to_i)
  erb(:new_definition)
end

post ("/words/:id")do
  definition = Definition.new(params[:definition], params[:id].to_i, nil)
  redirect to('/')
end

get ("/words/:id/definitions/update")do
  @word = Word.search(params[:id].to_i)
  erb(:update_definition)
end

patch ("/words/:id/definitions")do
  definition = Definition.search(params[:id].to_i)
  definition.definition = params[:definition]
  redirect to('/')
end

delete ("/words/:id/definitions")do
  definition = Definition.search(params[:id].to_i)
  definition.delete
  redirect to('/')
end

get ("/words/:id/update")do
  @word = Word.search(params[:id].to_i)
  erb(:update_word)
end


patch ("/words/:id")do
  word = Word.search(params[:id].to_i)
  word.word = params[:word]
  redirect to('/')
end

delete ("/words/:id")do
  word = Word.search(params[:id].to_i)
  word.delete
  redirect to('/')
end


get ("/words/:id/definitions/:definition_id")do
  @word = Word.search(params[:id].to_i)
  @definition = @word.definition
  binding.pry
  erb(:definition)
end
