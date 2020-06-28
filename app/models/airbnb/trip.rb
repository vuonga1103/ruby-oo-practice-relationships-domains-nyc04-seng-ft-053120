class Trip
  attr_reader :listing, :guest, :date_time_booked
  @@all = []

  def initialize(listing, guest)
    @listing = listing
    @guest = guest
    @date_time_booked = Time.now.strftime("%m/%d/%Y %H:%M")
    @@all << self
  end

  def self.all
    @@all
  end
end