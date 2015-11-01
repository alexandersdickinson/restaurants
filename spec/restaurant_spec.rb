require('spec_helper')

describe('.all') do
  it('initially returns an empty array') do
    expect(Restaurant.all()).to(eq([]))
  end
end

describe('#==') do
  it('is true if restaurants have the same name') do
    restaurant1 = Restaurant.new({:name => 'Spago'})
    restaurant2 = Restaurant.new({:name => 'Spago'})
    expect(restaurant1).to(eq(restaurant2))
  end
end

describe('#save') do
  it('saves the restaurant to the database') do
    restaurant = Restaurant.new({:name => 'Spago'})
    restaurant.save()
    expect(Restaurant.all()).to(eq([restaurant]))
  end
end