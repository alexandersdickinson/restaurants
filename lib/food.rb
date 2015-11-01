class Food
  attr_reader(:name, :price)
  
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @price = attributes.fetch(:price)
    @id = nil
  end
  
  def ==(comparison)
    self.name() == comparison.name()
  end
  
  def self.all()
    returned_food = DB.exec("SELECT * FROM food;")
    foods = []
    returned_food.each() do |food|
      name = food.fetch('name')
      id = food.fetch('id').to_i()
      price = food.fetch('price').to_i()
      foods.push(Food.new({:name => name, :price => price}))
    end
    foods
  end
  
  def save()
    result = DB.exec("INSERT INTO food (name, price) VALUES ('#{@name}', #{@price}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end
end