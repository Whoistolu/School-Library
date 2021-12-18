# Implement Book class
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(book)
    @rentals.push(book)
  end

  def to_s
    "Title: \"#{@title}\", Author: #{author}"
  end
end
