# require( 'sinatra' )
# require( 'sinatra/contrib/all' ) if development?
# require( 'pry-byebug' )
# require_relative( './models/artist.rb' )
# require_relative( './models/album.rb' )

get '/artists' do
  #INDEX
  @artists = Artist.all()
  erb :'artist/index'
end

get '/artists/new' do
  #NEW
  @artists = Artist.all
  erb :'new'
end

post '/artists' do
  #CREATE
  artist = Artist.new( params )
  artist.save()
  redirect to( "/stock")
end

get '/artists/:id' do
  #SHOW
  @artist = Artist.find( params[:id])
  @albums = @artist.albums()
  erb :'artist/show'
end

get '/artists/:id/edit' do
  #EDIT
  @artist = Artist.find( params[:id] )
  erb :'artist/edit'
end

put '/artists/:id' do
  #UPDATE
  @artist = Artist.update( params )
  redirect to( "/stock")
end

delete '/artists/:id' do
  #DELETE
  Artist.destroy( params[:id ])
  redirect to( "/stock")
end




