class Rental
  attr_accessor :date

  def initialize
    @date = date
  end

  def book=(book)
    @book = book
    @book.rentals.push(self) unless @book.rentals.include?(self)
  end
end