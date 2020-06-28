class Character
  attr_reader :name, :actor
  attr_accessor :movies, :episodes

  @@all = []

  def initialize(name, actor, movie_or_episode)
    @name = name
    @actor = actor
    @movies = []
    @episodes = []

    @movies << movie_or_episode if movie_or_episode.instance_of?(Movie)
    @episodes << movie_or_episode if movie_or_episode.instance_of?(Episode)

    @@all << self
  end

  def self.find_by_name_and_actor(name, actor)
    # takes in a character string name and an actor, returns matching character instance, if not found will return nil
    self.all.find { |character| character.name == name && character.actor == actor }
  end

  def shows
    # returns an array of all the shows the character is in
    self.episodes.map { |episode| episode.show }.uniq
  end
  
  def self.all
    @@all
  end

  def self.character_appearance_count
    # returns a hash, where each key is a character instance, and each value is a count of how many times a character appeared in movies and tv show
    hash = Hash.new
    self.all.each do |character|
      hash[character] = character.movies.count + character.shows.count
    end
    hash
  end

  def self.most_appearances
    # returns which character of film/tv appears in the most films/tv shows
    most_appearances_num = nil
    most_appearances_character = nil

    self.character_appearance_count.each do |character, appearance_count|
      if most_appearances_num == nil || most_appearances_num < appearance_count
        most_appearances_num = appearance_count
        most_appearances_character = character
      end
    end

    most_appearances_character
  end
  
end