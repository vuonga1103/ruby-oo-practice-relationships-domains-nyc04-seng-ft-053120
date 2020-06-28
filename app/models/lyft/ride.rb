class Ride 
  attr_reader :passenger, :driver, :distance
  @@all = []

  def initialize(passenger, driver, distance)
    @passenger = passenger
    @driver = driver
    @distance = distance

    @@all << self
  end

  def self.all
    @@all
  end

  def self.average_distance
    # - should find the average distance of all rides

    num_rides = self.all.count
    total_distance = self.all.reduce(0) { |sum, ride| sum + ride.distance }
    
    (total_distance * 1.0 / num_rides).round(1)
  end

end