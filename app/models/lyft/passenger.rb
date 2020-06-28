class Passenger
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def accepts_ride(driver, distance)
    # - creates a new ride
    Ride.new(self, driver, distance)
  end

  def rides
    # - returns all rides a passenger has been on
    Ride.all.select { |ride| ride.passenger == self }
  end

  def drivers
    # - returns all drivers a passenger has ridden with
    self.rides.map { |ride| ride.driver }.uniq
  end

  def total_distance
    # - should calculate the total distance the passenger has travelled with the service
    self.rides.reduce(0) { |sum, ride| sum + ride.distance }
  end

  def self.all
    @@all
  end

  def self.premium_members
    # - should find all passengers who have travelled over 100 miles with the service
  
    self.all.select { |passenger| passenger.total_distance > 100 }
  end
end