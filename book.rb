# frozen_string_literal: true

require_relative 'rental'

# The Book class represents a book, which has a title, author, and may be rented by people.
class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author, :rentals

  def add_rental(date, person)
    rental = Rental.new(date, self, person)
    @rentals << rental
    person.rentals << rental
  end
end
