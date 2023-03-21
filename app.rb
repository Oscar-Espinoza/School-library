# frozen_string_literal: true

require 'json'
require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative 'rental'

# app.rb
class App
  def initialize
    @data = load_data
  end

  def list_all_books
    @data["books"].each { |book| puts "Title: #{book["title"]}, Author: #{book["author"]}" }
  end

  def list_all_people
    @data["people"].each { |person| puts "[#{person["type"]}] Name: #{person["name"]}, ID: #{person["id"]}, Age: #{person["age"]}" }
  end

  def create_person(type, age, name, specialization, parent_permission: true)
    case type
    when '1'
      @data["people"] << { "type" => "Student", "age" => age, "name" => name, "parent_permission" => parent_permission }
    when '2'
      @data["people"] << { "type" => "Teacher", "age" => age, "name" => name, "specialization" => specialization }
    else
      puts "Invalid person type. Use 'teacher' or 'student'."
      return
    end
    save_data
    puts 'Person created successfully'
  end

  def create_book(title, author)
    @data["books"] << { "title" => title, "author" => author }
    save_data
    puts 'Book created successfully'
  end

  def create_rental
    book = choose_book
    person = choose_person
    date = rental_date

    if book && person
      rental = { "date" => date, "book" => book, "person" => person }
      @data["rentals"] << rental
      save_data
      puts 'Rental created successfully'
    else
      puts 'Invalid book ID or person ID. Please try again.'
    end
  end

  def choose_book
    loop do
      puts 'Choose a book'
      @data["books"].each_with_index { |book, i| puts "#{i}) Title: #{book["title"]} , Author: #{book["author"]}" }
      index = gets.chomp.to_i
      return @data["books"][index] if index < @data["books"].length && index >= 0

      puts 'Invalid number, try again'
    end
  end

  def choose_person
    loop do
      display_people_list
      index = gets.chomp.to_i
      return @data["people"][index] if valid_person_index?(index)

      puts 'Invalid number, try again'
    end
  end

  def display_people_list
    puts 'Choose a person'
    @data["people"].each_with_index do |person, i|
      puts "#{i}) [#{person["type"]}] Name: #{person["name"]}, ID: #{person["id"]}, Age: #{person["age"]}"
    end
  end

  def valid_person_index?(index)
    index < @data["people"].length && index >= 0
  end

  def rental_date
    puts 'Enter valid date in format yyyy/mm/dd'
    gets.chomp
  end

  def list_rentals_by_person_id(person_id)
    person = @data["people"].find { |p| p["id"] == person_id }

    if person
      puts "Rentals for #{person["name"]}:"
      @data["rentals"].each do |rental|
        if rental["person"] == person
          puts "Date: #{rental["date"]}, Book: #{rental["book"]["title"]} by #{rental["book"]["author"]}"
        end
      end
    else
      puts 'Invalid person ID. Please try again.'
    end
  end

  
end
