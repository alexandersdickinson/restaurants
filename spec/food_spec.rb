require('spec_helper')

describe('.all') do
  it('initially returns an empty array') do
    expect(Food.all()).to(eq([]))
  end
end

describe('#==') do 
  it('is equal if two foods have the same name') do
    food1 = Food.new({:name => 'pizza', :price => 0})
    food2 = Food.new({:name => 'pizza', :price => 0})
    expect(food1).to(eq(food2))
  end
end

describe('#save') do
  it('adds a food item to the list of foods') do
    food1 = Food.new({:name => 'pizza', :price => 0})
    food1.save()
    expect(Food.all()).to(eq([food1]))
  end
end