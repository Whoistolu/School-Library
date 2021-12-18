#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './person'
require_relative './student'
require_relative './rental'
require_relative './book'
require_relative './teacher'
require_relative './clasroom'

class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def run
    puts 'Welcome to School Library App!'

    loop do
      actions

      option = gets.chomp

      break if option == '7'

      handle_action option
    end

    puts 'Thank you for using this app!'
  end

  private

  def handle_action(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    else
      puts 'That is not a valid option'
    end
  end

  def actions
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def list_books
    @books.each { |book| puts book }
  end

  def list_people
    @people.each { |person| puts person }
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp

    case choice
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'That is not a valid input'
      nil
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    student = Student.new(age: age, name: name, parent_permission: parent_permission, classroom: @classroom)
    @people.push(student)

    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age: age, name: name, specialization: specialization)
    @people.push(teacher)

    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)

    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, i| puts "#{i}) #{book}" }

    book_i = gets.chomp.to_i

    puts
    puts 'Select a person from the following list by number (not ID)'
    @people.each_with_index { |person, i| puts "#{i}) #{person}" }

    person_i = gets.chomp.to_i

    puts
    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_i], @people[person_i])
    @rentals.push(rental)

    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp

    puts 'Rentals:'
    @rentals.each { |rental| puts rental if rental.person.id == id.to_i }
  end
end

def main
  app = App.new
  app.run
end

main
