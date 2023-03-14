# frozen_string_literal: true

require_relative 'base_decorator'

# CapitalizeDecorator is a decorator that modifies the behavior of Nameable objects by
# capitalizing the first letter of the correct_name string.
class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
