require 'rails_helper'

RSpec.describe 'courses index page' do

  it 'shows all of the courses' do
    course_1 = Course.create!(name: "Potions")
    course_2 = Course.create!(name: "Defense against the dark arts")

    visit "/courses"

    expect(page).to have_content(course_1.name)
    expect(page).to have_content(course_2.name)
  end

  it 'shows the number of students enrolled in each course' do
    course_1 = Course.create!(name: "Potions")
    course_2 = Course.create!(name: "Defense against the dark arts")
    student_1 = course_1.students.create!(name: "Harry", age: 15, house: "Gryffendor")
    student_2 = course_2.students.create!(name: "Ron", age: 15, house: "Gryffendor")

    visit "/courses"

    expect(course_1.num_students).to eq(1)
    expect(course_2.num_students).to eq(1)
    expect(page).to have_content(1)
  end
end
