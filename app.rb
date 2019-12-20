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
  binding.pry
  erb(:word)
end

get ("/words/:id/definitions/new")do
@word = Word.search(params[:id].to_i)
binding.pry
  erb(:new_definition)
end

post ("/words/:id")do
  definition = Definition.new(params[:definition], params[:id].to_i, nil)
  redirect to('/')
end
