require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../models/artist.rb' )

class TestArtist < MiniTest::Test

  def setup
     @artist = Artist.new( { 'name' => 'Eminem'} )
  end

  def test_create_name
    assert_equal('Eminem', @artist.name )
  end

  def test_update_name
    @artist.name = "Rihanna"
    assert_equal("Rihanna", @artist.name)
  end

end