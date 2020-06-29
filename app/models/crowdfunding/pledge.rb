class Pledge
  attr_reader :user, :project, :amount, :date
  @@all = []

  def initialize(user, project, amount)
    @user = user
    @project = project
    @amount = amount
    @date = Time.now.strftime("%m/%d/%Y")
    
    # add amount to the project's current_amount
    project.current_amount += amount
    # subtract the amount from the backer's money 
    user.money -= amount

    @@all << self
  end


  def self.all
    @@all
  end

end