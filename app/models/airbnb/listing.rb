class Listing
  attr_reader :city, :owner
  @@all = []

  def initialize(city, owner)
    @city = city
    @owner = owner
    @@all << self
  end

  def accept_guest(guest)
    # a listing should be able to accept a guest, when it accepts a guest, a new trip should be created
    Trip.new(self, guest)
  end

  def trips
    # returns an array of all trips at a listing
    Trip.all.select { |trip| trip.listing == self }
  end

  def guests
    # returns an array of all guests who have stayed at a listing
    self.trips.map { |trip| trip.guest }
  end

  def self.all
    @@all
  end

  def self.find_all_by_city(city)
    # takes an argument of a city name (as a string) and returns all the listings for that city
    self.all.select { |listing| listing.city == city }
  end

  def self.listing_trip_count
    # returns a hash where key is a listing instance, and value is the count of how many times that listing has been booked
    listing_trip_count_hash = Hash.new(0)
    Trip.all.each { |trip| listing_trip_count_hash[trip.listing] += 1 }
    listing_trip_count_hash
  end

  def self.most_popular
    # finds the listing that has had the most trips
    most_trips_num = 0
    most_trips_listing = nil

    self.listing_trip_count.each do |listing, trip_count|
      if trip_count > most_trips_num
        most_trips_num = trip_count
        most_trips_listing = listing
      end
    end

    most_trips_listing
  end
end