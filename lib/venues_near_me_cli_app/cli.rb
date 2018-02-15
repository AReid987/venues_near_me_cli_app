class VenuesNearMeCliApp::CLI

  def call
    list_venues
    menu
    goodbye
  end

  def list_venues
    puts "Venues near you:"
    @venues = VenuesNearMeCliApp::Venue.venues
  end

  def menu

    input = nil
    while input != "exit"
      puts "Enter the number of the venue you want more info about or type exit."
      input = gets.strip.downcase
      if input.to_i > 0 && @venues.length >= input.to_i
        puts @venues[input.to_i - 1]
      elsif input == "list"
        list_venues
      else
        puts "Invalid entry, please try again."
      end
    end

  end

  def goodbye
    puts "Thanks for finding venues near you, goodbye!"
  end

end
