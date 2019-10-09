require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can sign up got Acebook" do
    signup("mac@gmail.com", "123456")
    expect(page).to have_content("User successfully registered")
  end
  scenario "user can't register twice with the same email" do
    signup("mac@gmail.com", "123456")
    signup("mac@gmail.com", "123456")
    expect(page).to have_content("User already exists")
  end

  scenario "user can't register if email is invalid" do
    signup("mac@g", "123456")
    expect(page).to have_content("Invalid Email")
  end

  scenario "user can't register if password is less than 6 characters" do
    signup("mac@gmail.com", "1234")
    expect(page).to have_content("is too short (minimum is 6 characters)")
  end

  scenario "user can't register if password is greater than 10 characters" do
    signup("mac@gmail.com", "12345678999")
    expect(page).to have_content("is too long (maximum is 10 characters)")
  end

  scenario "user is redirected to posts page upon successful signup" do
    signup("mac@gmail.com", "123456")
    expect(current_path).to eq('/posts')
  end


end
