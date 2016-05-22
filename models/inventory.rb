require( 'pry-byebug' )


class Inventory

 
 attr_accessor :id, :artist_id, :album_id

  def initialize( options )
    @id = options[ 'id' ].to_i
    @artist_id = options[ 'artist_id' ].to_i
    @album_id = options[ 'album_id' ].to_i
  end

  def save()
    sql = "INSERT INTO inventory ( artist_id, album_id)
    VALUES ( #{@artist_id}, #{album_id}) RETURNING *"
    return Inventory.map_item( sql )
  end

  def self.all()
    sql = "SELECT * FROM inventory"
    result = Inventory.map_items( sql )
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
    inventory = SqlRunner.run( sql )
    result = inventory.map { |item| Inventory.new( item ) }
    return result
  end

  def self.map_item( sql )
    inventory = Inventory.map_items( sql )
    return inventory.first
  end

  def self.delete_all()
    sql = "DELETE FROM inventory"
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
    if Inventory.search_artist( name ) != nil
      return Inventory.search_artist( name )
    else
      Inventory.search_album( name )
    end
  end


end








