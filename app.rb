# app.rb

require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative 'rental'

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

  def create_person(type, age, name, specialization = nil, parent_permission = true)
    if type == '1'
      @people << Student.new(age, name, parent_permission: parent_permission)
    elsif type == '2'
      @people << Teacher.new(age, specialization, name)
    else
      puts "Invalid person type. Use 'teacher' or 'student'."
    end
    puts "Person created successfully"
  end

  def create_book(title, author)
    @books << Book.new(title, author)
  end

  def create_rental()
    book = nil
    loop do
      puts "Choose a book"
      @books.each_index {|i| puts "#{i}) Title: #{@books[i].title} , Author: #{@books[i].author}"}
      index = gets.chomp.to_i
      if index < @books.length && index >= 0
        book = @books[index]
        break
      end
      puts 'Invalid number, try again'
    end

    person = nil
    loop do
      puts "Choose a person"
      @people.each_index {|i| puts "#{i}) [#{@people[i].class}] Name: #{@people[i].name}, ID: #{@people[i].id}, Age: #{@people[i].age}"}
      index = gets.chomp.to_i
      if index < @people.length && index >= 0
        person = @people[index]
        break
      end
      puts 'Invalid number, try again'
    end

    puts "Enter valid date in format yyyy/mm/dd"
    date = gets.chomp

    puts book
    puts person

    if book && person
      rental = Rental.new(date, book, person)
      @rentals << rental
      puts 'Rental created successfully'
    else
      puts 'Invalid book ID or person ID. Please try again.'
    end
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
