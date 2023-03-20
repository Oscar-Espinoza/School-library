# frozen_string_literal: true

# menu.rb
class Menu
  def initialize(app)
    @app = app
  end

  def menu_actions(choice)
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
    end
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

      if choice < 1 || choice > 7
        puts 'Invalid option. Please choose a number between 1 and 7.'
      else
        menu_actions(choice)
        break if choice == 7
      end
    end
  end

  private

  def create_person_menu
    loop do
      type, name, age = create_person_display
      if type == '1'
        create_person_with_parent_permission(type, name, age)
        break
      elsif type == '2'
        create_person_with_specialization(type, name, age)
        break
      else
        puts 'Invalid input, please enter 1 or 2.'
      end
    end
  end

  def create_person_display
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp
    puts 'Enter name:'
    name = gets.chomp
    puts 'Enter age:'
    age = gets.chomp.to_i
    [type, name, age]
  end

  def create_person_with_parent_permission(type, name, age)
    puts 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    permission = true if %w[Y y].include?(permission)
    permission = false if %w[N n].include?(permission)
    @app.create_person(type, age, name, nil, parent_permission: permission)
  end

  def create_person_with_specialization(type, name, age)
    puts 'Enter specialization:'
    specialization = gets.chomp
    @app.create_person(type, age, name, specialization)
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
