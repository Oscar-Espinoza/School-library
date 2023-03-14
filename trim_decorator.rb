# frozen_string_literal: true

require_relative 'base_decorator'

# TrimmerDecorator is a decorator that trims whitespace from the name of a Nameable object.
# It delegates the correct_name method to the wrapped Nameable object, and modifies the
# returned value by trimming leading and trailing whitespace.
class TrimmerDecorator < BaseDecorator
  def correct_name
    name = @nameable.correct_name
    if name.length > 10
      name[0..9]
    else
      name
    end
  end
end
