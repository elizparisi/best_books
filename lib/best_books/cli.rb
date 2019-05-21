class BestBooks::CLI 
  
  def call 
    puts ""
    puts "**************************************".magenta
    puts "**************************************".magenta
    puts "*WELCOME TO GOODREADS BEST BOOKS LIST*".magenta
    puts "**************************************".magenta
    puts "**************************************".magenta
    puts ""
    puts "Here are the best books of 2019!".cyan
    puts ""
    BestBooks::Scraper.scrape_page
    book_list
    puts ""
    puts ""
    menu 
    goodbye
  end
  
  def book_list
    @books = BestBooks::Book.all
    @books.each.with_index(1) do |book, i|
      puts "#{i}. #{book.title}"
    end
  end
  
  def menu
    input = nil 
    
    while input != "exit"
      puts "Enter a number 1-200 that corresponds with the book you'd like more info on, type list to see the list of books again, or type exit to leave:".green
      
      input = gets.strip.downcase
      
      # if the input is greater than 0 and less than or equal to 200 
      if input.to_i > 0 && input.to_i <= @books.count
      list = @books[input.to_i-1]
        display_book(list)
      
      elsif input == "list"
        book_list
        
      elsif input == "search"
        puts "Which author do you want books for? Enter the name here:".yellow
        input = gets.strip.downcase
        result = BestBooks::Book.find_by_author(input)
         result.each {|book| display_book(book)}
         
        if result == []
          puts "I'm sorry, there is no match for that author. Please try again.".red
          
        else 
          display_book(list)
        end
        
      else 
        puts "I don't understand, please try again. Enter a number 1-200 for more information on a book, or type exit to leave.".red
      end
    end
  end
  
  def display_book(list)
    puts ""
    puts "#{list.title}, by #{list.author}".blue
    puts "Rating: #{list.rating}".light_blue
    puts "Find out more here: #{list.url}".light_blue
  end
  
  def goodbye 
    puts ""
    puts "*****************************************************".magenta
    puts "*****************************************************".magenta
    puts "*Thanks for visiting, come back soon for more books!*".magenta
    puts "*****************************************************".magenta
    puts "*****************************************************".magenta
    puts ""
  end
end