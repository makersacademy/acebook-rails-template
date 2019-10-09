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
  

end
