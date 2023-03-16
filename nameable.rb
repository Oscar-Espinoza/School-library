# frozen_string_literal: true

# Nameable is a base class for objects that have a "name" attribute and need to be
# able to produce a "correct name" based on that attribute.
class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
