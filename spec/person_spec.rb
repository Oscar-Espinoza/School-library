# spec/person_spec.rb

require 'rspec'
require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Person do
  let(:person) { Person.new(25, 'John Doe') }
  let(:book) { Book.new('The Catcher in the Rye', 'J.D. Salinger') }

  describe '#initialize' do
    it 'creates a person with the given age, name, and parent permission' do
      expect(person.age).to eq(25)
      expect(person.name).to eq('John Doe')
      expect(person.parent_permission).to eq(true)
    end

    it 'creates a person with an empty array of rentals' do
      expect(person.rentals).to eq([])
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age or has parent permission' do
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns false if the person is not of age and has no parent permission' do
      person = Person.new(15, 'Jane Doe', false)
      expect(person.can_use_services?).to eq(false)
    end
  end

  describe '#rent_book' do
    it 'adds a new rental to the rentals array' do
      date = '22/03/2023'
      person.rent_book(date, book)

      expect(person.rentals.size).to eq(2)
      expect(person.rentals.first.date).to eq(date)
      expect(person.rentals.first.book).to eq(book)
      expect(person.rentals.first.person).to eq(person)
    end
  end
end
