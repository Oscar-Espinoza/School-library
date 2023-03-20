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


end
