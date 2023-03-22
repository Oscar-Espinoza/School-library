# spec/book_spec.rb

require 'rspec'
require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Book do
  let(:book) { Book.new('The Catcher in the Rye', 'J.D. Salinger') }
  let(:person) { Person.new(25, 'John Doe') }

  describe '#initialize' do
    it 'creates a book with the given title and author' do
      expect(book.title).to eq('The Catcher in the Rye')
      expect(book.author).to eq('J.D. Salinger')
    end

    it 'creates a book with an empty array of rentals' do
      expect(book.rentals).to eq([])
    end
  end

  describe '#add_rental' do
    it 'adds a new rental to the rentals array' do
      date = '22/03/2023'
      book.add_rental(date, person)

      expect(book.rentals.size).to eq(2)
      expect(book.rentals.first.date).to eq(date)
      expect(book.rentals.first.book).to eq(book)
      expect(book.rentals.first.person).to eq(person)
    end
  end
end
