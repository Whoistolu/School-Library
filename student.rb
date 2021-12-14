require_relative("./person")

class Student < Person
  def initialize(*args, **kwargs)
    super(*args, **kwargs)
    @classroom = nil;
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end