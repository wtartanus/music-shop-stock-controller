require( 'pry-byebug' )
require_relative( 'artist.rb' )
require_relative( 'album.rb' )
require_relative( '../db/sql_runner.rb')

Album.delete_all()
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

album1 = Album.new( { 'name' => '8 mile', 'gender' => 'H', 'price_buying' => 5, 'price_selling' => 20, 'stock' => 10} )
album2 = Album.new( { 'name' => 'The Eminem Show', 'gender' => 'H', 'price_buying' => 4, 'price_selling' => 17, 'stock' => 25} )
album3 = Album.new( { 'name' => 'Magia', 'gender' => 'P', 'price_buying' => 5, 'price_selling' => 21, 'stock' => 30} )
album4 = Album.new( { 'name' => 'She Wolf', 'gender' => 'P', 'price_buying' => 7, 'price_selling' => 25, 'stock' => 40} )
album5 = Album.new( { 'name' => 'Shakira', 'gender' => 'P', 'price_buying' => 6, 'price_selling' => 22, 'stock' => 39} )
album6 = Album.new( { 'name' => 'Anti', 'gender' => 'P', 'price_buying' => 4, 'price_selling' => 17, 'stock' => 40} )
album7 = Album.new( { 'name' => 'Gold Cobra ', 'gender' => 'R', 'price_buying' => 7, 'price_selling' => 23, 'stock' => 50} )
album8 = Album.new( { 'name' => 'Meteora', 'gender' => 'R', 'price_buying' => 5, 'price_selling' => 20, 'stock' => 35} )

a1 = album1.save()
a2 = album2.save()
a3 = album3.save()
a4 = album4.save()
a5 = album5.save()
a6 = album6.save()
a7 = album7.save()
a8 = album8.save()

binding.pry
nil

