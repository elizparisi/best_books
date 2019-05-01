class Scraper
  
  def self.scrape_page
    doc = Nokogiri::HTML(open("https://www.goodreads.com/book/popular_by_date/2019"))
    
    doc.css("table.tableList tr").each do |book_css|
      book = Book.new 
      book.title = book_css.css("a.bookTitle span").text.strip
      book.author = book_css.css("a.authorName").text.strip
      book.url = "https://www.goodreads.com#{book_css.css("a.bookTitle").attribute("href").value}"
      book.rating = book_css.css("span.minirating").text.gsub("\u2014",",").strip
      book.save
    end
  end 
end