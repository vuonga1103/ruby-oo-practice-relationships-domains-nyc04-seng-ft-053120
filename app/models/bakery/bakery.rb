class Bakery
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def desserts
    # Returns an array of desserts the bakery makes
    Dessert.all.select { |dessert| dessert.bakery == self}
  end

  def add_dessert(name, ingredients)
    # Add a dessert instance to the bakery and returning it
    Dessert.new(name, self, ingredients)
  end

  def ingredients
  # Return an array of ingredients for the bakery's desserts
    self.desserts.map { |dessert| dessert.ingredients }.flatten
  end

  def average_calories
    # Return a number totaling the average num of calories for the desserts sold at this bakery
    sum = self.ingredients.reduce(0) { |sum, ingredient| sum + ingredient.calories }
    amount = self.ingredients.count

    sum * 1.0 / amount
  end

  def shopping_list
    # should return a string of names for ingredients for the bakery
    names_str = ''
    self.ingredients.uniq.each_with_index do |ingredient, idx|
      if idx == ingredients.uniq.length - 1
        names_str += "#{ingredient.name}."
      else
        names_str += "#{ingredient.name}, "
        names_str +=  "and " if idx == ingredients.uniq.length - 2
      end
    end
    names_str
  end
end