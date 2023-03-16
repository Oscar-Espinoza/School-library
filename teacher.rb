# frozen_string_literal: true

require_relative 'person'

# Teacher is a Nameable object representing a teacher.
class Teacher < Person
  def initialize(age, specialization, name = 'Unknown')
    super(name, age)

    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
