class Actor
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def all_characters
    # returns an array of all characters the actor has ever played
    Character.all.select { |character| character.actor == self }
  end

  def movies
    # returns an array of all movies the actor has been in
    self.all_characters.map { |character| character.movies }.flatten.uniq
  end

  def self.actor_characters
    # returns a hash, where each key is an actor and each value is an array of all the characters the actor has played
    hash = Hash.new
    self.all.each { |actor| hash[actor] = actor.all_characters }
    hash
  end

  def self.most_characters
    # returns which actor has most different characters played
    most_char_num = 0
    most_char_actor = nil

    self.actor_characters.each do |actor, characters|
      if characters.count > most_char_num
        most_char_num = characters.count
        most_char_actor = actor
      end
    end
    
    most_char_actor
  end

end