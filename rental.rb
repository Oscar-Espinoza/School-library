# frozen_string_literal: true

# The Rental class represents a rental transaction, which includes a date, a book, and a person who rented the book.
class Rental
  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book
  end

  attr_accessor :date
  attr_reader :person, :book
end
