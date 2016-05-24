require( 'pry-byebug' )
require_relative( 'artist.rb' )
require_relative( 'album.rb' )
require_relative( 'discography.rb' )
require_relative( '../db/sql_runner.rb')

Discography.delete_all()
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


album1 = Album.new( { 'name' => '8 mile', 'genre' => 'Rap',
 'price_buying' => 5, 'price_selling' => 20, 'stock' => 10} )
album2 = Album.new( { 'name' => 'The Eminem Show', 'genre' => 'Rap', 
  'price_buying' => 4, 'price_selling' => 17, 'stock' => 25} )
album3 = Album.new( { 'name' => 'Magia', 'genre' => 'Pop', 
  'price_buying' => 5, 'price_selling' => 21, 'stock' => 30} )
album4 = Album.new( { 'name' => 'She Wolf', 'genre' => 'Pop',
 'price_buying' => 7, 'price_selling' => 25, 'stock' => 40} )
album5 = Album.new( { 'name' => 'Shakira', 'genre' => 'Pop', 
  'price_buying' => 6, 'price_selling' => 22, 'stock' => 39} )
album6 = Album.new( { 'name' => 'Anti', 'genre' => 'Pop', 
  'price_buying' => 4, 'price_selling' => 17, 'stock' => 40} )
album7 = Album.new( { 'name' => 'Gold Cobra', 'genre' => 'Rock',
 'price_buying' => 7, 'price_selling' => 23, 'stock' => 50} )
album8 = Album.new( { 'name' => 'Meteora', 'genre' => 'Rock', 
  'price_buying' => 5, 'price_selling' => 20, 'stock' => 35} )

al1 = album1.save()
al2 = album2.save()
al3 = album3.save()
al4 = album4.save()
al5 = album5.save()
al6 = album6.save()
al7 = album7.save()
al8 = album8.save()

discography1 = Discography.new( { 'artist_id' => a2.id, 'album_id' => al1.id } )
discography2 = Discography.new( { 'artist_id' => a2.id, 'album_id' => al2.id } )
discography3 = Discography.new( { 'artist_id' => a3.id, 'album_id' => al3.id } )
discography4 = Discography.new( { 'artist_id' => a3.id, 'album_id' => al4.id } )
discography5 = Discography.new( { 'artist_id' => a3.id, 'album_id' => al5.id } )
discography6 = Discography.new( { 'artist_id' => a1.id, 'album_id' => al6.id } )
discography7 = Discography.new( { 'artist_id' => a4.id, 'album_id' => al7.id } )
discography8 = Discography.new( { 'artist_id' => a5.id, 'album_id' => al8.id } )

d1 = discography1.save()
d2 = discography2.save()
d3 = discography3.save()
d4 = discography4.save()
d5 = discography5.save()
d6 = discography6.save()
d7 = discography7.save()
d8 = discography8.save()



binding.pry
nil





















