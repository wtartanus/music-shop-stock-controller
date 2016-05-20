require( 'pg' )

class SqlRuner

  def self.run( sql )
    begin
      db = PG.connect( { dbname: 'music_library', host: 'localhost'} )
      db.exex( sql )
    ensure
      db.close()
    end
  end

end