# frozen_string_literal: true

require 'securerandom'
require_relative 'nameable'

class Person < Nameable
  def initialize(age, parent_permission = true, name = 'Unknown')
    raise ArgumentError, 'Age cannot be nil.' if age.nil?

    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
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
end
