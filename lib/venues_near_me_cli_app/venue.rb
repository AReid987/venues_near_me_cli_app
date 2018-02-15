class VenuesNearMeCliApp::Venue
  attr_accessor :name, :address, :phone, :url
  def self.venues
    #return instances of venues

    venue_1 = self.new
    venue_1.name = "Mohawk"
    venue_1.address = "912 Red River St Austin, TX 78701"
    venue_1.phone = "(512) 666-0877"
    venue_1.url = "https://mohawkaustin.com/"

    venue_2 = self.new
    venue_2.name = "Parish"
    venue_2.address = "214 E 6th St Austin, TX 78701"
    venue_2.phone = nil
    venue_2.url = "https://theparishaustin.com/"

    [venue_1, venue_2]
  end


end
