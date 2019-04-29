class Scraper
  
  def scrape_page
    html = open("https://www.goodreads.com/book/popular_by_date/2019")
    doc = Nokogiri::HTML(html)
    
    
  
end