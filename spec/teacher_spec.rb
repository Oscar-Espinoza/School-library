# frozen_string_literal: true

require 'rspec'
require_relative '../teacher'
describe Teacher do
  let(:teacher) { Teacher.new(30, 'Math', 'John Doe') }
  describe '#initialize' do
    it 'creates a teacher with the given age, specialization, and name' do
      expect(teacher.age).to eq(30)
      expect(teacher.name).to eq('John Doe')
      expect(teacher.specialization).to eq('Math')
    end
  end
  describe '#can_use_services?' do
    it 'returns true for all teachers' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
