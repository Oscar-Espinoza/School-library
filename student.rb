# frozen_string_literal: true

require_relative 'person'

class Student < Person
  def initialize(age, name = 'Unknown', parent_permission: true, classroom: nil)
    super(age, name, parent_permission)

    @classroom = classroom
    classroom.students << self if @classroom
  end

  attr_accessor :classroom

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self
  end
end
