class Show
  attr_reader :name, :episodes

  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def add_episode(number, name)
    # add an episode to the TV show and returns that episode
    Episode.new(number, name, self)
  end

  def episodes
    Episode.all.select { |episode| episode.show == self }
  end

  def actors
    # returns an array of all the actors in this tv show
    self.episodes.map { |episode| episode.actors }.flatten.uniq
  end

  def characters
    #returns an array of all the characters who appear in this show
    self.episodes.map { |episode| episode.characters }.flatten.uniq
  end

  def on_the_big_screen
    #returns movies that share the same name as this show
    Movie.all.select { |movie| movie.name == self.name }
  end

  def self.all
    @@all
  end

end