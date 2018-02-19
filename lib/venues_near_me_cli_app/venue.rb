class VenuesNearMeCliApp::Venue
  attr_accessor :name, :address, :phone, :url

  def self.scrape_yelp
    venues = []
    user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36"
    @zipcode = VenuesNearMeCliApp::CLI.zipcode
    url = "https://www.yelp.com/search?find_desc=Music+Venues&find_loc=#{@zipcode}&start=0"
    doc = Nokogiri::HTML(open(url, 'User-Agent' => user_agent))
    venues_doc = doc.css("li.regular-search-result")

    venues_doc.collect.with_index do |venue, i|
      venue = VenuesNearMeCliApp::Venue.new
      venue.name = venues_doc.css("h3.search-result-title a span")[i].text.strip
      venue.address = venues_doc.css("div.secondary-attributes address")[i].to_s.gsub('<br>', ' ').gsub('<address>', ' ').gsub('</address>', ' ').strip
      #url = venues_doc.css("h3.search-result-title span.indexed-biz-name a")[i].attribute("href").value.strip
      #venue_page = Nokogiri::HTML(open("https://www.yelp.com#{url}", 'User-Agent' => user_agent))
      #venue_url = venue_page.css("li span.biz-website.js-biz-website.js-add-url-tagging a").attribute("href").value
      #venue.url = venue_url[/[w]+.\w+.(com)/]
      venue.phone = venues_doc.css("div.secondary-attributes span.biz-phone")[i].text.strip
      venues << venue
    end
    venues
  end

end
