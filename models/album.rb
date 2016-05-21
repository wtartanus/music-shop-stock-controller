class Album


  attr_reader :id
  attr_accessor :name, :gender, :price_buying, :price_selling, :stock

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @gender = options[ 'gender' ]
    @price_buying = options[ 'price_buying' ]
    @price_selling = options[ 'price_selling' ]
    @stock = options[ 'stock' ].to_i
  end
end