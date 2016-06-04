require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require( 'pry-byebug' )
require_relative( './controllers/artist_controller.rb' )
require_relative( './controllers/album_controller.rb' )
require_relative( './models/artist.rb' )
require_relative( './models/album.rb' )
require_relative( './models/discography.rb' )
require_relative( './models/shop.rb' )

get '/' do
  @albums = Album.all
  @stats = Shop.statistic_by_genre( @albums )
  erb :home
end

get '/stock' do
  @artists = Artist.all
  @options = params

  erb :stock
end

get '/stock/search' do
  @name = params.values.first
  @artists = Artist.all
  @result = Discography.search( @name.downcase )
  if @result.class == Artist
    @artist = @result
    @albums = @artist.albums()
    erb :'artist/edit'
  elsif @result.class == Album
    @album = @result
    @artist = @album.artist()
    erb :'album/edit'
  else
    erb :wrong_search
  end

end
