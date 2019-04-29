class CLI 
  
  def call 
    puts ""
    puts "**************************************"
    puts "**************************************"
    puts "*WELCOME TO GOODREADS BEST BOOKS LIST*"
    puts "**************************************"
    puts "**************************************"
    puts ""
    puts "Here are the best books of 2019!"
    Scraper.scrape_page
    book_list
    menu 
    goodbye
  end
  
  def book_list
    Book.all.each_with_index(1) do |book, i|
      puts "#{i}. #{book.title}"
    end
  end
  
  def menu
    input = nil 
    
    while input != "exit"
      puts "Enter a number 1-200 that corresponds with the book you'd like more info on, type list to see the list of books again, or type exit to leave:"
      
      input = gets.strip.downcase
      
      # if the input is greater than 0 and less than or equal to 200 
      if input.to_i > 0 && input.to_i <= @books.count
      the_list = @books[input.to_i-1]
        puts ""
        puts "#{the_list.title}, by #{the_list.author}"
        puts "Rating: #{the_list.rating}"
        puts "Find out more here: #{the_list.url}"
      
      elsif input == "list"
        book_list
        
      else 
        "I don't understand, please try again. Enter a number 1-200 for more information on a book, or type exit to leave."
      end
    end
  end
  
  def goodbye 
    puts ""
    puts "*****************************************************"
    puts "*****************************************************"
    puts "*Thanks for visiting, come back soon for more books!*"
    puts "*****************************************************"
    puts "*****************************************************"
    puts ""
  end
end