require 'rails_helper'

RSpec.describe 'students show page' do

  it 'shows all of the students' do
    student_1 = Student.create!(name: "Harry", age: 14, house: "Gryffendor")
    student_2 = Student.create!(name: "Ron", age: 15, house: "Gryffendor")

    visit "/students"

    expect(page).to have_content(student_1.name)
    expect(page).to have_content(student_2.name)
    expect(page).to have_content(student_1.age)
    expect(page).to have_content(student_1.house)
  end

  it 'shows the average age of all students' do
    student_1 = Student.create!(name: "Harry", age: 15, house: "Gryffendor")
    student_2 = Student.create!(name: "Ron", age: 17, house: "Gryffendor")
    student_3 = Student.create!(name: "Luna", age: 13, house: "Ravenclaw")
    student_4 = Student.create!(name: "Draco", age: 16, house: "Slytherin")

    visit "/students"

    expect(page).to have_content(15.25)
  end
end
