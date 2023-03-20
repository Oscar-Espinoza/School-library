# frozen_string_literal: true

# menu.rb
class Menu
  def initialize(app)
    @app = app
  end

  def display_menu
    loop do
      puts "\nPlease choose an option by entering a number:"
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person ID'
      puts '7 - Exit'

      choice = gets.chomp.to_i

      case choice
      when 1
        @app.list_all_books
      when 2
        @app.list_all_people
      when 3
        create_person_menu
      when 4
        create_book_menu
      when 5
        @app.create_rental
      when 6
        list_rentals_menu
      when 7
        puts 'Goodbye!'
        break
      else
        puts 'Invalid option. Please choose a number between 1 and 7.'
      end
    end
  end

  private

  def create_person_menu
    loop do
      puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      type = gets.chomp
      puts 'Enter name:'
      name = gets.chomp
      puts 'Enter age:'
      age = gets.chomp.to_i

      case type
      when '1'
        puts 'Has parent permission? [Y/N]: '
        permission = gets.chomp
        permission = true if %w[Y y].include?(permission)
        permission = false if %w[N n].include?(permission)
        @app.create_person(type, age, name, nil, parent_permission: permission)
        break
      when '2'
        puts 'Enter specialization:'
        specialization = gets.chomp
        @app.create_person(type, age, name, specialization)
        break
      else
        puts 'Invalid input, please enter 1 or 2.'
      end
    end
  end

  def create_book_menu
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp
    @app.create_book(title, author)
  end

  def list_rentals_menu
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i
    @app.list_rentals_by_person_id(person_id)
  end
end
