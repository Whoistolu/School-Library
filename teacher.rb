# frozen_string_literal: true

require_relative('./person')

# Inherits from Person
class Teacher < Person
  def initialize(*args, specialization:, **kwargs)
    super(*args, **kwargs)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
