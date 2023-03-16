# frozen_string_literal: true

# The Book class represents a book, which has a title, author, and may be rented by people.
class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author
end
