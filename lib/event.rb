class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.each_with_object([]) do |k ,acc|
      acc << k.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all{|truck|truck.inventory.include?(item)}
  end

  def sorted_item_list
    #doesn't account for if they are in stock
    item_names = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.keys.each do |item|
        if item.check_stock != 0
        item_names << item.name
      end
    end
    item_names.uniq!.sort
  end

  def total_inventory
    sub_hash = {}
    @food_trucks.each do |food_truck|
      food_truck.inventory.keys.each do |item|
        sub_hash[item] ||= {quantity: 0, food_trucks: []}
        sub_hash[item][:quantity] += food_truck.inventory[item]
        sub_hash[item][:food_trucks] << food_truck
      end
    end
    sub_hash
  end

  def overstocked_items

  end

end
