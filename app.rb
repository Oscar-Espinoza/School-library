# frozen_string_literal: true

require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative 'rental'

# app.rb
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person(type, age, name, specialization, parent_permission)
    if type == '1'
      @people << Student.new(age, name, parent_permission: parent_permission)
    elsif type == '2'
      @people << Teacher.new(age, specialization, name)
    else
      puts "Invalid person type. Use 'teacher' or 'student'."
    end
    puts 'Person created successfully'
  end

  def create_book(title, author)
    @books << Book.new(title, author)
  end

  def create_rental
    book = choose_book
    person = choose_person
    date = rental_date

    if book && person
      rental = Rental.new(date, book, person)
      @rentals << rental
      puts 'Rental created successfully'
    else
      puts 'Invalid book ID or person ID. Please try again.'
    end
  end

  def choose_book
    loop do
      puts 'Choose a book'
      @books.each_index { |i| puts "#{i}) Title: #{@books[i].title} , Author: #{@books[i].author}" }
      index = gets.chomp.to_i
      return @books[index] if index < @books.length && index >= 0

      puts 'Invalid number, try again'
    end
  end

  def choose_person
    loop do
      display_people_list
      index = gets.chomp.to_i
      return @people[index] if valid_person_index?(index)

      puts 'Invalid number, try again'
    end
  end

  def display_people_list
    puts 'Choose a person'
    @people.each_index do |i|
      puts "#{i}) [#{@people[i].class}]
            Name: #{@people[i].name}, ID: #{@people[i].id},
            Age: #{@people[i].age}"
    end
  end

  def valid_person_index?(index)
    index < @people.length && index >= 0
  end

  def rental_date
    puts 'Enter valid date in format yyyy/mm/dd'
    gets.chomp
  end

  def list_rentals_by_person_id(person_id)
    person = @people.find { |p| p.id == person_id }

    if person
      puts "Rentals for #{person.name}:"
      person.rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" }
    else
      puts 'Invalid person ID. Please try again.'
    end
  end
end
