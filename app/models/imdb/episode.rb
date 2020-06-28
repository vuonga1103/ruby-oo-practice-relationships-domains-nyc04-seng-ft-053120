class Episode
  attr_reader :number, :name, :show
  @@all = []

  def initialize(number, name, show)
    @number = number
    @name = name
    @show = show
    
    @@all << self
  end

  def add_character(name, actor)
    character = Character.find_by_name_and_actor(name, actor)
    if !character
      Character.new(name, actor, self)
    else
      character.episodes << self
    end
  end

  def characters
    # returns all characters in this episode
    Character.all.select { |character| character.episodes.include?(self) }
  end

  def actors
    self.characters.map { |character| character.actor }
  end

  def self.all
    @@all
  end

end