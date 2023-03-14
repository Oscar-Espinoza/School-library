# frozen_string_literal: true

require_relative 'person'

# Student is a Nameable object representing a student.

class Student < Person
  def initialize(age, classroom, name = 'Unknown', _parent_permission: true)
    super(name, age, parent_permision)

    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
