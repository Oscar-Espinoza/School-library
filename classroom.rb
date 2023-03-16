# frozen_string_literal: true

# The Classroom class represents a classroom, which has a label and may have many students.
class Classroom
  def initialize(label)
    @label = label
    @students = []
  end

  attr_accessor :label
  attr_reader :students

  def add_student(student)
    @students << student
    student.classroom = self
  end

  def students=(students)
    @students = students
    students.each { |student| student.classroom = self }
  end
end
