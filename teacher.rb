# frozen_string_literal: true

require_relative 'person'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown')
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
