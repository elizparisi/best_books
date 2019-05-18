class BestBooks::Book
  
  attr_accessor :title, :author, :url, :rating
  @@all = []
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  #homework- add find_by_author method
  def self.find_by_author(author)
    self.select { |book| book.author == author}
  end
end