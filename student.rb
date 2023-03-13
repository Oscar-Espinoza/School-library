# frozen_string_literal: true

require_relative 'person'

class Student < Person
  def initialize(name, age, parent_permision, classroom)
    super(name, age, parent_permision)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
