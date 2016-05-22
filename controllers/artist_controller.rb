require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require( 'pry-byebug' )
require_relative( '../models/artist.rb' )

get '/artists' do
  #INDEX
  @artists = Artist.all()
  erb :index
end

get '/artists/new' do
  #NEW
end

post '/artists' do
  #CREATE
end

get 'artists/:id' do
  #SHOW
end

get 'artists/:id/edit' do
  #EDIT
end

put 'artists/:id' do
  #UPDATE
end

delete '/artists/:id' do
  #DELETE
end