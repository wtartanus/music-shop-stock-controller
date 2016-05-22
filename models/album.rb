class Album


  attr_reader :id
  attr_accessor :name, :gender, :price_buying, :price_selling, :stock

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @gender = options[ 'gender' ]
    @price_buying = options[ 'price_buying' ].to_i
    @price_selling = options[ 'price_selling' ].to_i
    @stock = options[ 'stock' ].to_i
  end

  def save()
    sql = "INSERT INTO albums (name, gender, price_buying, price_selling, stock) 
         VALUES ( 
         '#{@name}', 
         '#{@gender}', 
         #{@price_buying}, 
         #{@price_selling}, 
         #{@stock}) RETURNING *"
    album = SqlRunner.run( sql ).first
    return Album.new( album )
  end

  def artist()
    sql = "SELECT artists.* FROM artists
           INNER JOIN inventory ON artists.id = inventory.artist_id
           WHERE inventory.album_id = #{@id}"

      result = Artist.map_items( sql )
      return result.first
  end


  def profit()
    spend_money = @price_buying * @stock
    incoming_money = @price_selling * @stock
    profit = incoming_money - spend_money
    return profit
  end

  #SORT FUNCTIONS ###################

  def self.sort_gender( albums )
    result = albums.sort_by { |album| album.gender }
    return result
  end

  def self.sort_name( albums )
    result = albums.sort_by { |album| album.name }
    return result
  end

  def self.sort_price_buying_min( albums )
    result = albums.sort_by { |album| album.price_buying }
    return result
  end

  def self.sort_price_buying_max( albums )
    result = albums.sort_by { |album| album.price_buying }
    return result.reverse
  end

  def self.sort_price_selling_min( albums )
    result = albums.sort_by { |album| album.price_selling }
    return result
  end

  def self.sort_price_selling_max( albums )
    result = albums.sort_by { |album| album.price_selling }
    return result.reverse
  end

  ####################################

  def self.all()
    sql = "SELECT * FROM albums"
    result = Album.map_items( sql )
    return result
  end

  def update()
    sql = "UPDATE albums SET 
      name = '#{ @name }',
      gender = '#{ @gender }',
      price_buying = #{ @price_buying },
      price_selling = #{ @price_selling },
      stock = #{ @stock }
       WHERE id = #{ @id }"
    SqlRunner.run( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run( sql )
  end



  def self.map_items( sql )
     albums = SqlRunner.run( sql )
     result = albums.map { |album| Album.new( album ) }
     return result
  end

  def self.map_item( sql )
    album = Album.map_items( sql )
    return album.first
  end

end