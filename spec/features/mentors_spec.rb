require 'rails_helper'
require 'web_helpers'

RSpec.feature "Mentor", type: :feature do

  scenario "can sign up" do
    sign_up_mentor
    expect(page).to have_content("Welcome,Test")
  end

  scenario "can sign in" do
    sign_up_mentor
    click_link 'Log out'
    sign_in_mentor
    expect(page).to have_content("Welcome,Test")
  end

  scenario "can sign out" do
    sign_up_mentor
    click_link "Log out"
    expect(page).to have_content("Signed out successfully.")
  end

  scenario "can add a student" do
    sign_up_mentor
    sign_up_student
    sign_out_student
    sign_in_mentor
    fill_in "mentor[student_email]", with: "Test123@student.com"
    click_button "Add Student"
    expect(page).to have_content("Test123@student.com")
  end
end
