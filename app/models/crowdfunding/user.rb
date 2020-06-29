class User
  attr_reader :name
  attr_accessor :money
  @@all = []

  def initialize(name, money)
    @name = name
    @money = money
    @@all << self
  end

  def create_project(name, purpose, goal_amount)
    # Allows a user to create a new project, returns that project
    Project.new(self, name, purpose, goal_amount)
  end

  def pledge_project(project, amount)
    # Allows a user to back a project by making a pledge
    Pledge.new(self, project, amount)

    # Pledge class takes care of money transaction with creation of a new pledge
  end

  def projects_created
    # Returns an array of projects the user created
    Project.all.select { |project| project.owner == self }
  end

  def pledges
    # Returns an array of all the pledges the user has made
    Pledge.all.select { |pledge| pledge.user == self }
  end

  def projects_and_amount_backed
    # Returns a hash where each key is the each project the user has backed, and each value is the total amount the user has pledged to that project
    hash = Hash.new(0)
    self.pledges.each { |pledge| hash[pledge.project] += pledge.amount }
    hash
  end

  def projects_backed
    # Returns an array of objects the user has backed
    self.projects_and_amount_backed.keys
  end

  def self.highest_pledge
    # Returns the user who made the highest pledge
    highest_pledge_amount = 0
    highest_pledge_user = nil

    Pledge.all.each do |pledge|
      if pledge.amount > highest_pledge_amount
        highest_pledge_amount = pledge.amount
        highest_pledge_user = pledge.user
      end
    end

    highest_pledge_user
  end

  def self.multi_pledger
    # Returns all users who have pledged to multiple projects
    User.all.select { |user| user.projects_backed.count > 1 }
  end

  def self.project_creator
    # Returns all users who have created a project
    self.all.select { |user| user.projects_created.count >= 1 }
  end

  def self.all
    @@all
  end
end