class Restaurant
  attr_reader(:name)
  
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = nil
  end
  
  def ==(comparison)
    self.name() == comparison.name()
  end
  
  def self.all()
    returned_restaurants = DB.exec("SELECT * FROM restaurants;")
    restaurants = []
    returned_restaurants.each() do |restaurant|
      name = restaurant.fetch('name')
      id = restaurant.fetch('id').to_i()
      restaurants.push(Restaurant.new({:name => name, :id => id}))
    end
    restaurants
  end
  
  def save()
    result = DB.exec("INSERT INTO restaurants (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end
end