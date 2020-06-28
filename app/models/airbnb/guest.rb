class Guest
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def trips
    # returns an array of all trips a guest has made
    Trip.all.select { |trip| trip.guest == self }
  end

  def listings
    # returns an array of all listings a guest has stayed at
    self.trips.map { |trip| trip.listing }
  end

  def trip_count
    # returns the number of trips a guest has taken
    self.trips.count
  end

  def self.all
    @@all
  end

  def self.guest_trip_count
    # helper function, returns a hash where k is guest instance and v is the count of trips that the guest has been on
    guest_trip_count_hash = Hash.new(0)
    Trip.all.each { |trip| guest_trip_count_hash[trip.guest] += 1 }
    guest_trip_count_hash
  end

  def self.pro_traveller
    # returns an array of all guests who have made over 1 trip
    over_1_trip_guests = []
    self.guest_trip_count.each { |guest, trip_count| over_1_trip_guests << guest if trip_count > 1 }
    over_1_trip_guests 
  end
end