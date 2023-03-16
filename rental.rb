# frozen_string_literal: true

# The Rental class represents a rental transaction, which includes a date, a book, and a person who rented the book.
class Rental
  def initialize(date, book, person)
    @date = date
    @person = person
    @person.rentals << self
    @book = book
    @book.rentals << self
  end

  attr_accessor :date
  attr_reader :person, :book
end
