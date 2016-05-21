require_relative( '../db/sql_runner.rb' )
require( 'pry-byebug' )

class Artist

  

 attr_accessor :name
 attr_reader :id


  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ( '#{@name}') RETURNING *"
    artist = SqlRunner.run( sql ).first
    return Artist.new( artist )
  end

  def update()
    sql = "UPDATE artists SET name = '#{ @name }' WHERE id = #{ @id }"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM artists"
    result = Artist.map_items( sql )
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run( sql )
  end

  def self.map_items( sql )
     artists = SqlRunner.run( sql )
     result = artists.map { |artist| Artist.new( artist) }
     return result
  end

  def self.map_item( sql )
    artists = Artist.map_items( sql )
    return artists.first
  end

end