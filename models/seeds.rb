require( 'pry-byebug' )
require_relative( 'artist.rb' )
require_relative( '../db/sql_runner.rb')

Artist.delete_all()

artist1 = Artist.new( {'name' => 'Rihanna'} )
artist2 = Artist.new( {'name' => 'Eminem'} )
artist3 = Artist.new( {'name' => 'Shakira'} )
artist4 = Artist.new( {'name' => 'Limp Bizkit'} )
artist5 = Artist.new( {'name' => 'Linkin Park'} )

a1 = artist1.save()
a2 = artist2.save()
a3 = artist3.save()
a4 = artist4.save()
a5 = artist5.save()

binding.pry
nil

