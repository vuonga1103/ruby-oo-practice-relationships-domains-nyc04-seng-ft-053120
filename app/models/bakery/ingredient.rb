class Ingredient
  attr_reader :name, :calories
  @@all = []

  def initialize(name, calories)
    @name = name
    @calories = calories
    @@all << self
  end

  def bakery
    # Return the bakery object that uses that ingredient
    Dessert.all.find {|dessert| dessert.ingredients.include?(self) }.bakery
  end

  def self.all
    @@all
  end

  def self.find_all_by_name(ingredient)
    # takes a string arg, return an array of all ingredients that include tthat stirng in their name
    self.all.select { |ingredient_instance| ingredient_instance.name.include?(ingredient) }
  end
end