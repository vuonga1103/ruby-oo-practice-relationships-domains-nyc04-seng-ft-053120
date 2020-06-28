class Dessert
  attr_reader :name, :bakery, :ingredients
  @@all = []

  def initialize(name, bakery, ingredients)
    @name = name
    @bakery = bakery
    @ingredients = ingredients

    @@all << self
  end

  def self.all
    @@all
  end

  def calories
    # Returns a num totaling the calories for all the ingredients included in that dessert
    self.ingredients.reduce(0) { |sum, ingredient| sum + ingredient.calories }
  end
end