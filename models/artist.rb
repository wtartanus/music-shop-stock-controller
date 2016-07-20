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

  def self.update( options )
    sql = "UPDATE artists SET name = '#{ options[:name] }' WHERE id = #{ options[:id] }"
    SqlRunner.run( sql )
  end

  def albums()
    sql = " SELECT albums.* FROM albums
    INNER JOIN discography ON albums.id = discography.album_id
    WHERE discography.artist_id = #{ @id } "
    result = Album.map_items( sql )
    return result
  end

  def self.all()
    sql = "SELECT * FROM artists"
    result = Artist.map_items( sql )
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM artists WHERE id = #{ id }"
    result = Artist.map_item( sql )
    return result
  end

  def self.find_by_name( name )
    sql = "SELECT * FROM artists WHERE name = '#{name}'"
    result = Artist.map_item( sql )
    return result
  end

  def self.sort_name( artists )
    result = artists.sort_by { |artist| artist.name }
    return result
  end

  def self.destroy( id )
    sql = "DELETE FROM artists WHERE id = #{id}"
    SqlRunner.run( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run( sql )
  end

  def self.map_items( sql )
     artists = SqlRunner.run( sql )
     result = artists.map { |artist| Artist.new( artist) }
     result = Shop.capitalize_string(result)
     return result
  end

  def self.map_item( sql )
    artists = Artist.map_items( sql )
    return artists.first
  end

end
