require( 'pry-byebug' )


class Discography

 
 attr_accessor :id, :artist_id, :album_id

  def initialize( options )
    @id = options[ 'id' ].to_i
    @artist_id = options[ 'artist_id' ].to_i
    @album_id = options[ 'album_id' ].to_i
    # @albums = Album.all
    # @artists = Artist.all
  end


  def save()
    sql = "INSERT INTO discography ( artist_id, album_id)
    VALUES ( #{@artist_id}, #{album_id}) RETURNING *"
    return Discography.map_item( sql )
  end

  def self.all()
    sql = "SELECT * FROM discography"
    result = Discography.map_items( sql )
    return result
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = '#{@artist_id}'"
    result = Artist.map_item( sql )
    return result
  end

  def self.profit_all()
    albums = Album.all
    prices = albums.map { |album| album.profit }
    profit = prices.inject(0) { |x, num| x + num }
    return profit
  end

  def album()
    sql = "SELECT * FROM albums WHERE id = '#{@album_id}'"
    result = Album.map_item( sql )
    return result
  end

  def self.map_items( sql )
    discography = SqlRunner.run( sql )
    result = discography.map { |item| Discography.new( item ) }
    return result
  end

  def self.map_item( sql )
    discography = Discography.map_items( sql )
    return discography.first
  end

  def self.delete_all()
    sql = "DELETE FROM discography"
    SqlRunner.run( sql )
  end

  def self.search_artist( name )
    sql = "SELECT * FROM artists WHERE name = '#{name}'"
    result = Artist.map_item( sql )
    return result
  end

  def self.search_album( name )
    sql = "SELECT * FROM albums WHERE name = '#{name}'"
    result = Album.map_item( sql )
    return result
  end

  def self.search( name )
    if Discography.search_artist( name ) != nil
      return Discography.search_artist( name )
    else
      return Discography.search_album( name )
    end
  end

  def self.check( options, albums )
    result = albums
    if options[:sort] == "asc" && options[:by] == "price_sell_max"
      result = Album.sort_price_selling_max( albums )
    elsif options[:sort] == "des" && options[:by] == "price_sell_min"
      result = Album.sort_price_selling_min( albums )
    elsif options[:sort] == "asc" && options[:by] == "price_buying_max"
      result = Album.sort_price_buying_max( albums )
    elsif options[:sort] == "des" && options[:by] == "price_buying_min"
      result = Album.sort_price_buying_min( albums )
    end
    return result 
  end


end








