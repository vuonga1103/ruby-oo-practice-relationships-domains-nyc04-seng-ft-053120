class Project
  attr_reader :owner, :name, :purpose, :goal_amount
  attr_accessor :current_amount
  @@all = []

  def initialize(owner, name, purpose, goal_amount)
    @owner = owner
    @name = name
    @purpose = purpose
    @goal_amount = goal_amount
    @current_amount = 0

    @@all << self
  end
  
  def amount_left_to_go
    difference = self.goal_amount - self.current_amount
    if difference == 0 
      "Goal met"
    elsif difference < 0
      "Goal met! Exceeded by $#{-difference}!"
    else
      "$#{difference}"
    end
  end

  def pledges
    # Returns an array of pledges created for this project
    Pledge.all.select { |pledge| pledge.project == self }
  end

  def pledgers
    # Returns a unique array of the project's pledgers
    self.pledges.map { |pledge| pledge.user }.uniq  
  end
  
  def self.with_pledges
    # Returns in a unique array all the projects that have pledges
    Pledge.all.map { |pledge| pledge.project }.uniq
  end

  def self.no_pledges
    # Returns all projects which have no pledges yet
    Project.all.select { |project| !self.with_pledges.include?(project) }
  end

  def self.above_goal
    # returns all projects which have met or exceeded their pledge goal
    Project.all.select { |project| project.current_amount >= project.goal_amount }
  end

  def self.most_backers
    # Returns the project with the highest number of backers

    highest_num_backers = 0
    highest_num_backers_project = nil

    Project.all.each do |project|
      if project.pledgers.count > highest_num_backers
        highest_num_backers = project.pledgers.count
        highest_num_backers_project = project
      end
    end

    highest_num_backers_project
  end

  def self.all
    @@all
  end

end