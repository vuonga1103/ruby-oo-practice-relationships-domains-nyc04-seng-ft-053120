require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# airbnb test cases------------------------

# l1 = Listing.new("Brooklyn", "Owner1")
# l2 = Listing.new("Manhattan", "Owner2")
# l3 = Listing.new("Bronx", "Owner3")
# g1 = Guest.new("Guest1")
# g2 = Guest.new("Guest2")
# g3 = Guest.new("Guest3")

# l1.accept_guest(g1)
# l1.accept_guest(g2)
# l1.accept_guest(g3)

# l2.accept_guest(g2)
# l3.accept_guest(g3)
# l3.accept_guest(g2)

# imdb test cases -------------------------

# joseph = Actor.new("Joseph Gordon-Levitt")
# ellen = Actor.new("Ellen Page")
# tom = Actor.new("Tom Hardy")
# jim = Actor.new("Jim Carrey")
# kate = Actor.new("Kate Winslet")
# sarah = Actor.new("Sarah Jessica Parker")
# kim = Actor.new("Kim Cattrall")

# inception = Movie.new("Inception", 2010, "Action")
# inception.add_character("Arthur", joseph)
# inception.add_character("Ariadne", ellen)
# inception.add_character("Eames", tom)

# eternal = Movie.new("Eternal Sunshine of the Spotless Mind", 2004, "Drama")
# eternal.add_character("Joel Barish", jim)
# eternal.add_character("Clementine Kruczynski", kate)

# sex = Show.new("Sex and the City")
# sex_e1 = sex.add_episode(1, "Sex and the City")
# sex_e1.add_character("Carrie Bradshaw", sarah)
# sex_e1.add_character("Samantha Jones", kim)

# sex_e2 = sex.add_episode(2, "Models and Mortals")
# sex_e2.add_character("Carrie Bradshaw", sarah)
# sex_e2.add_character("Samantha Jones", kim)


# sex_movie = Movie.new("Sex and the City", 2008, "Comedy")
# sex_movie.add_character("Carrie Bradshaw", sarah)
# sex_movie.add_character("Samantha Jones", kim)


# bakery test cases -----------------------------------
# b1 = Bakery.new("Marthas")
# flour = Ingredient.new("flour", 100)
# sugar = Ingredient.new("sugar", 100)
# cocoa_powder = Ingredient.new("cocoa powder", 100)
# milk = Ingredient.new("milk", 100)
# cream = Ingredient.new("cream", 100)
# skim_milk = Ingredient.new("skim milk", 50)

# b1.add_dessert("red velvet cupcake", [flour, sugar, cocoa_powder, milk])
# d1 = b1.add_dessert("tres leches", [milk, cream, flour, skim_milk])

# lyft test cases -----------------------------------
# anh = Passenger.new("Anh")
# dao = Passenger.new("Dao")

# bob = Driver.new("Bob")
# teddy = Driver.new("Teddy")
# tammy = Driver.new("Tammy")

# ride1 = anh.accepts_ride(bob, 10)
# ride2 = anh.accepts_ride(teddy, 3)
# ride3 = tammy.accepts_ride(dao, 150)


binding.pry
"anh"