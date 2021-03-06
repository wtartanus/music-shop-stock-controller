class Album


  attr_reader :id
  attr_accessor :name, :genre, :price_buying, :price_selling, :stock, :shelf

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @genre = options[ 'genre' ]
    @price_buying = options[ 'price_buying' ].to_i
    @price_selling = options[ 'price_selling' ].to_i
    @stock = options[ 'stock' ].to_i
    @shelf = options[ 'shelf' ]
  end

  def save()
    sql = "INSERT INTO albums (name, genre, price_buying, price_selling, stock, shelf)
         VALUES (
         '#{@name}',
         '#{@genre}',
         #{@price_buying},
         #{@price_selling},
         #{@stock},
         '#{@shelf}') RETURNING *"
    album = SqlRunner.run( sql ).first
    return Album.new( album )
  end

  def artist()
    sql = "SELECT artists.* FROM artists
           INNER JOIN discography ON artists.id = discography.artist_id
           WHERE discography.album_id = #{@id}"

      result = Artist.map_items( sql )
      return result.first
  end

  def self.find( id )
    sql = "SELECT * FROM albums WHERE id = #{ id }"
    result = Album.map_item( sql )
    return result
  end


  def self.all()
    sql = "SELECT * FROM albums"
    result = Album.map_items( sql )
    return result
  end

  def self.update( options )
    sql = "UPDATE albums SET
      name = '#{ options[:name] }',
      genre = '#{ options[:genre] }',
      price_buying = #{ options[:price_buying] },
      price_selling = #{ options[:price_selling] },
      stock = #{ options[:stock] },
      shelf = '#{ options[:shelf] }'
       WHERE id = #{ options[:id] }"
    SqlRunner.run( sql )
  end

  def self.check_low_stock
    albums = Album.all()
    albums_low_stock = []

    for album in albums
      if album.stock < 11
        albums_low_stock << album
      end
    end
  return albums_low_stock
  end

  def self.destroy( id )
    sql = "DELETE FROM albums WHERE id = #{id}"
    SqlRunner.run( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run( sql )
  end



  def self.map_items( sql )
     albums = SqlRunner.run( sql )
     result = albums.map { |album| Album.new( album ) }
     result = Shop.capitalize_string(result)
     return result
  end

  def self.map_item( sql )
    album = Album.map_items( sql )
    return album.first
  end

end
