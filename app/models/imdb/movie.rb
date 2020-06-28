class Movie
  attr_reader :name, :year, :genre
  @@all = []

  def initialize(name, year, genre)
    @name = name
    @year = year
    @genre = genre
    @@all << self
  end

  def add_character(name, actor)
    # link a character and actor to the movie
    character = Character.find_by_name_and_actor(name, actor)
    if !character
      Character.new(name, actor, self)
    else
      character.movies << self
    end
  end

  def characters
    # returns an array of all characters in this movie
    Character.all.select { |character| character.movies.include?(self) }
  end

  def actors
    # returns an array of all actors in this movie
    self.characters.map { |character| character.actor }
  end

  def self.all
    @@all
  end

  def self.movies_and_actors
    # returns a hash, where each key is a movie, and each value is an array of the movie's actors
    hash = Hash.new
    self.all.each { |movie| hash[movie] = movie.actors }
    hash
  end

  def self.most_actors
    # returns the movie which has the most actors in it
    most_actors_num = 0
    most_actors_movie = nil

    self.movies_and_actors.each do |movie, actors|
      if actors.count > most_actors_num
        most_actors_num = actors.count
        most_actors_movie = movie
      end
    end

    most_actors_movie
  end
end