# frozen_string_literal: true

require_relative 'person'

class Teacher < Person
  def initialize(name, age, parent_permision, specialization)
    super(name, age, parent_permision)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
