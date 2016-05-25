require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../db/sql_runner.rb' )
require_relative( '../models/album.rb' )
require_relative( '../models/shop.rb' )
require_relative( '../models/artist.rb' )

class TestShop < MiniTest::Test

  def setup
     @albums = Album.all
  end

  def test_stock_total
    test = Shop.stock_total( @albums )
    assert_equal( 269, test)
  end

  def test_profit_all
    test = Shop.profit_all( @albums )
    assert_equal( 4144, test)
  end

  def test_profit
    test = Shop.profit( @albums[2])
    assert_equal( 480, test)
  end

end