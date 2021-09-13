require 'rails_helper'

RSpec.describe 'students show page' do

  it 'shows the courses this student is taking' do
    student = Student.create!(name: "Harry", age: 15, house: "Gryffendor")
    course_1 = student.courses.create!(name: "Potions")
    course_2 = student.courses.create!(name: "Defense Against the Dark Arts")

    visit "/students/#{student.id}"

    expect(page).to have_content(course_1.name)
    expect(page).to have_content(course_2.name)
  end
end
