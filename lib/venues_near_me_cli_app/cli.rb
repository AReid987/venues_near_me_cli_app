class VenuesNearMeCliApp::CLI
  #attr_accessor :zipcode
  @@zipcode = nil

  def call
    self.class.get_zipcode
    list_venues
    menu
  end

  def self.get_zipcode
    puts "Enter your zipcode to find music venues near you:"
    if gets.strip.length == 5
      @@zipcode = gets.strip
    else
      puts "Incorrect zipcode, please try again."
      get_zipcode
    end
  end

  def self.zipcode
    @@zipcode
  end


  def list_venues
    @venues = VenuesNearMeCliApp::Venue.scrape_yelp
    @venues.each.with_index(1) do |venue, i|
      puts "#{i}. #{venue.name}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the venue you want more info about, type list to list venues, or type exit."
      input = gets.strip.downcase
      if input.to_i > 0 && @venues.length >= input.to_i
        the_venue = @venues[input.to_i - 1]
        puts "#{the_venue.name} - #{the_venue.phone} - #{the_venue.address} - #{the_venue.url}"
      elsif input == "list"
        list_venues
      elsif input == "exit"
        goodbye
      else
        puts "Invalid entry, please try again."
      end
    end

  end

  def goodbye
    puts "Thanks for finding venues near you, goodbye!"
  end

end
