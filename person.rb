# frozen_string_literal: true

require 'securerandom'
require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission = true)
    raise ArgumentError, 'Age cannot be nil.' if age.nil?

    super()
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age, :parent_permission
  attr_reader :id

  private

  def is_of_age?
    @age > 18
  end

  public

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def rent_book(date, book)
    rental = Rental.new(date, book, self)
    @rentals << rental
    book.rentals << rental
    rental
  end
end
