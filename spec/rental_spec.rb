# frozen_string_literal: true

require 'rspec'
require_relative '../rental'
require_relative '../book'
require_relative '../person'
describe Rental do
  let(:book) { Book.new('The Catcher in the Rye', 'J.D. Salinger') }
  let(:person) { Person.new(25, 'John Doe') }
  let(:date) { '22/03/2023' }
  let(:rental) { Rental.new(date, book, person) }
  describe '#initialize' do
    it 'creates a rental with the given date, book, and person' do
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
    it 'adds the rental to the book\'s rentals array' do
      expect(book.rentals).to include(rental)
    end
    it 'adds the rental to the person\'s rentals array' do
      expect(person.rentals).to include(rental)
    end
  end
end
