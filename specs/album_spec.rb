require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../models/album.rb' )

class TestAlbum < MiniTest::Test

  def setup
     @album = Album.new( { 'name' => 'Eminem', 'gender' => 'H', 'price_buying' => 5, 'price_selling' => 20, 'stock' => 10} )
  end

  def test_create_name
    assert_equal('Eminem', @album.name )
  end

  def test_update_name
    @album.name = "Rihanna"
    assert_equal("Rihanna", @album.name )
  end

  def test_create_gender
    assert_equal('H', @album.gender )
  end

  def test_update_gender
    @album.gender = "R"
    assert_equal("R", @album.gender )
  end

  def test_create_price_buying
    assert_equal( 5, @album.price_buying )
  end

  def test_update_price_buying
    @album.price_buying = 4
    assert_equal( 4, @album.price_buying )
  end

  def test_create_selling_price
    assert_equal( 20, @album.price_selling )
  end

  def test_update_selling_price
    @album.price_selling = 19
    assert_equal( 19, @album.price_selling )
  end

  def test_create_stock
    assert_equal( 10, @album.stock )
  end

  def test_update_stock
    @album.stock = 9
    assert_equal( 9, @album.stock )
  end

  def test_profit
    profit = @album.profit()
    assert_equal( 150,profit)
  end

end



























