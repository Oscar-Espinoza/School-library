# frozen_string_literal: true

require_relative 'nameable'

# BaseDecorator is a base class for decorators that modify the behavior of Nameable objects.
# It provides a default implementation of the correct_name method that delegates to the wrapped
# Nameable object.
class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
