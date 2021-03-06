class FoodTruck

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}

  end

  def check_stock(item)
    return 0 if @inventory[item] == nil
    @inventory[item]
  end

  def stock(item, quantity)
    if @inventory[item] == nil
      @inventory[item] = quantity
    else
      @inventory[item] += quantity
    end
  end

  def potential_revenue
    total_revenue = 0
    @inventory.each do |item|
      total_revenue += item[0].price * item[1]
    end
    total_revenue
  end

end
