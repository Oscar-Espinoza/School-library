# frozen_string_literal: true

# spec/classroom_spec.rb

require 'rspec'
require_relative '../classroom'
require_relative '../student'

describe Classroom do
  let(:classroom) { Classroom.new('Math') }
  let(:student) { Student.new(15, 'Jane Doe', parent_permission: true) }

  describe '#initialize' do
    it 'creates a classroom with the given label' do
      expect(classroom.label).to eq('Math')
    end

    it 'creates a classroom with an empty array of students' do
      expect(classroom.students).to eq([])
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom and updates the student\'s classroom' do
      classroom.add_student(student)

      expect(classroom.students).to include(student)
      expect(student.classroom).to eq(classroom)
    end
  end

  describe '#students=' do
    it 'updates the students array and sets their classroom' do
      student2 = Student.new(16, 'John Doe', parent_permission: true)
      classroom.students = [student, student2]

      expect(classroom.students).to eq([student, student2])
      expect(student.classroom).to eq(classroom)
      expect(student2.classroom).to eq(classroom)
    end
  end
end
