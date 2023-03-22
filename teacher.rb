# frozen_string_literal: true

require_relative 'person'

# Teacher is a Nameable object representing a teacher.
class Teacher < Person
  def initialize(age, specialization, name = 'Unknown')
    super(age, name)

    @specialization = specialization
  end

  attr_accessor :specialization

  def can_use_services?
    true
  end
end
