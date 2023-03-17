# main.rb

require_relative 'app'

def main
  app = App.new
  puts 'Welcome to the School Library App!'

  loop do
    puts "\nPlease choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person ID"
    puts "7 - Exit"

    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      loop do
        puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
        type = gets.chomp
        puts 'Enter name:'
        name = gets.chomp
        puts 'Enter age:'
        age = gets.chomp.to_i
      
        if type == '1'
          puts 'Has parent permission? [Y/N]: '
          permission = gets.chomp
          permission = true if permission == 'Y' || permission == 'y'
          permission = false if permission == 'N' || permission == 'n'
          app.create_person(type, age, name, nil, permission)
          break
        elsif type == '2'
          puts 'Enter specialization:'
          specialization = gets.chomp
          app.create_person(type, age, name, specialization)
          break
        else
          puts "Invalid input, please enter 1 or 2."
        end
      end      
    when 4
      puts 'Enter book title:'
      title = gets.chomp
      puts 'Enter book author:'
      author = gets.chomp
      app.create_book(title, author)
    when 5
      app.create_rental()
    when 6
      puts 'Enter person ID:'
      person_id = gets.chomp.to_i
      app.list_rentals_by_person_id(person_id)
    when 7
      puts 'Goodbye!'
      break
    else
      puts 'Invalid option. Please choose a number between 1 and 7.'
    end
  end
end

main
