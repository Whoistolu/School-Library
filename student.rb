# frozen_string_literal: true

require_relative('./person')

# Inherits from Person
class Student < Person
  def initialize(*args, **kwargs)
    super(*args, **kwargs)
    @classroom = nil
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
