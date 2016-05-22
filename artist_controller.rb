require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require( 'pry-byebug' )
require_relative( './models/artist.rb' )
require_relative( './models/album.rb' )

get '/artists' do
  #INDEX
  @artists = Artist.all()
  erb :'artist/index'
end

get '/artists/new' do
  #NEW
  erb :'artist/new'
end

post '/artists' do
  #CREATE
  artist = Artist.new( params )
  artist.save()
end

get '/artists/:id' do
  #SHOW
  @artist = Artist.find( params[:id])
  @albums = @artist.albums()
  erb :'artist/show'
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