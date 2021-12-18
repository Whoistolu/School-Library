require_relative('./corrector')

# Implement Person class
class Person
  attr_accessor :name, :age, :parent_permission, :rentals
  attr_reader :id

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def add_rentals(person)
    @rentals.push(person)
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  def to_s
    "Name: #{@name}, ID: #{@id}, Age: #{@age}"
  end
end
