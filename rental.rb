# frozen_string_literal: true

class Rental
  attr_accessor :date

  def initialize(book, person, date = DateTime.now())
    @date = date
    self.book = book
    self.person = person
  end

  def book=(book)
    @book = book
    @book.rentals.push(self) unless @book.rentals.include?(self)
  end

  def person=(person)
    @person = person
    @person.rentals.push(self) unless @person.rentals.include?(self)
  end
end
