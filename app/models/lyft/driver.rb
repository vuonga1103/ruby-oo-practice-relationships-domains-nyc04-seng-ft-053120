class Driver
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def accepts_ride(passenger, distance)
    Ride.new(passenger, self, distance)
  end

  def rides
    # - returns all rides a driver has made
    Ride.all.select { |ride| ride.driver == self }
  end

  def self.all
    @@all
  end

  def passengers
    # - returns all passengers a driver has had
    self.rides.map { |ride| ride.passenger }.uniq
  end

  def mileage
    # - helper function that returns driver's total mileage
    self.rides.reduce(0) { |sum, ride| sum + ride.distance }
  end

  def self.mileage_cap(distance)
    # - takes an argument of a distance (float) and returns all drivers who have exceeded that mileage
    self.all.select { |driver| driver.mileage > distance }
  end

end