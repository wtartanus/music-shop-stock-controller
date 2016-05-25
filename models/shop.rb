class Shop





  def self.sort_name( artist )
    result = artists.sort_by { |artist| artist.name }
    return result
  end

  #SORT FUNCTIONS ###################

  def self.sort_genre( albums )
    result = albums.sort_by { |album| album.genre }
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

  def self.check( options, albums )
    result = albums
    if options[:sort] == "asc" && options[:by] == "price_sell_max"
      result = Shop.sort_price_selling_max( albums )
    elsif options[:sort] == "des" && options[:by] == "price_sell_min"
      result = Shop.sort_price_selling_min( albums )
    elsif options[:sort] == "asc" && options[:by] == "price_buying_max"
      result = Shop.sort_price_buying_max( albums )
    elsif options[:sort] == "des" && options[:by] == "price_buying_min"
      result = Shop.sort_price_buying_min( albums )
    end
    return result 
  end

  ###################################
  #STATISTIC

  def self.stock_total( albums )
    stock = albums.map { |album| album.stock }
    stock = stock.inject( 0 ) { |x, num| x + num }
    return stock
  end

  def self.get_genres( albums )
    genre = []
    genres = albums.map { |album| album.genre }
    genres.uniq!
    for genre_name in genres
      genre << { "genre" => genre_name , "stock" => 0, 
        "profit" => 0, "buy_price" => 0 }
    end
    return genre
  end

  def self.statistic_by_genre( albums )
    genres = Shop.get_genres( albums )

    for item in genres
      for album in albums
        if album.genre == item["genre"]
          item["stock"] += album.stock
          item["profit"] += Shop.profit( album )
          item["buy_price"] += (album.price_buying * album.stock )
        end
      end
    end

    return genres
  end

  def self.total_spend( albums )
    genres = Shop.statistic_by_genre( albums )
    spend = genres.map { |album| album["stock"] * album["buy_price"]}

    total_spend = spend.inject( 0 ) { |x, money| x + money}
      return total_spend
  end


  def self.profit( album )
    spend_money = album.price_buying * album.stock
    incoming_money = album.price_selling * album.stock
    profit = incoming_money - spend_money
    return profit
  end

  def self.profit_all( albums )
    prices = albums.map { |album| Shop.profit( album ) }
    profit = prices.inject(0) { |x, num| x + num }
    return profit
  end




















end