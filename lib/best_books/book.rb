class Book
  
  attr_accessor :title, :author, :url, :rating
  @@all = []
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
end