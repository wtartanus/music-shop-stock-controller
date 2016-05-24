require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require( 'pry-byebug' )
require_relative( './controllers/artist_controller.rb' )
require_relative( './controllers/album_controller.rb' )
require_relative( './models/artist.rb' )
require_relative( './models/album.rb' )
require_relative( './models/discography.rb' )

get '/' do
  erb :home
end

get '/stock' do
  @artists = Artist.all 
  @options = params
  # if params[:sort] == "asc" && params[:by] == "price_sell_max"
  #   erb :stock_asc
  # else
  
  erb :stock
end

get '/stock/search' do
  name = params.values.first

  @result = Discography.search( name)
 
  if @result.class == Artist
    @artist = @result
    @albums = @artist.albums()
    erb :'artist/show'
  else
    @album = @result
    @artist = @album.artist()
    erb :'album/show'
  end

end