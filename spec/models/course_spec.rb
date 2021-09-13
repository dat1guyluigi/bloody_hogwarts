require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe 'methods' do

    it 'shows the number of students in a course' do
      course = Course.create!(name: "Potions")
      student_1 = course.students.create!(name: "Harry", age: 15, house: "Gryffendor")
      student_2 = course.students.create!(name: "Ron", age: 16, house: "Gryffendor")

      expect(course.num_students).to eq(2)
    end
  end

end
