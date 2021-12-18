# Implement Rental class
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def to_s
    # puts "Debug ==> Date: #{@date}, Book: \"#{book}\" by #{book}"
    "Date: #{@date}, Book: \"#{book.title}\" by #{@book.author}"
  end
end
