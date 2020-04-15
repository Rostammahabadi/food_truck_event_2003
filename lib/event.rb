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
    item_names = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.keys.each do |item|
        item_names << item.name
      end
    end
    item_names.uniq!.sort
  end

end
