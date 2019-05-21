class BestBooks::Book
  
  attr_accessor :title, :author, :url, :rating
  @@all = []
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  #this method should return an array of books by author name passed in
  def self.find_by_author(author)     
    @@all.select { |b| b.author == author}   
  end
end