# require( 'sinatra' )
# require( 'sinatra/contrib/all' ) if development?
# require( 'pry-byebug' )
# require_relative( './models/artist.rb' )
# require_relative( './models/album.rb' )
# require_relative( './models/inventory.rb' )

get '/albums' do
  #INDEX
  @albums = Album.all()
  erb :'album/index'
end

get '/albums/new' do
  #NEW
  @artists = Artist.all
  erb :'album/new'
end

post '/albums' do
  #CREATE
  album = Album.new( params )
  album = album.save
  options = { 'artist_id' => params[:artist_id], 'album_id' => album.id }
  Discography.new( options ).save
  redirect to( "/stock")
end

get '/albums/:id' do
  #SHOW
  @album = Album.find( params[:id])
  
  @artist = @album.artist()

  erb :'album/show'
end

get '/albums/:id/edit' do
  #EDIT

  @album = Album.find( params[:id] )
  erb :'album/edit'
end

put '/albums/:id' do
  #UPDATE
  @album = Album.update( params )
  redirect to( "/stock")
end

delete '/albums/:id' do
  #DELETE
  Album.destroy( params[:id ])
  redirect to( "/stock")
end








