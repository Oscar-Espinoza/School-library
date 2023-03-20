# frozen_string_literal: true

# main.rb

require_relative 'app'
require_relative 'menu'

def main
  app = App.new
  menu = Menu.new(app)
  puts 'Welcome to the School Library App!'
  menu.display_menu
end

main
