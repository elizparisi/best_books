require_relative "./best_books/version"
require 'pry'
require 'nokogiri'
require 'open-uri'

module BestBooks
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./best_books/cli"
require_relative "./best_books/scraper"
require_relative "./best_books/book"