# frozen_string_literal: true

class Nameable
  def correct_name
    raise NotImplementedError, 'Subclass must implement abstract method'
  end
end
