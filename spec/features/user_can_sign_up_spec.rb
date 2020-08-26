require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "user sign up button" do
    visit '/' 
    expect(page).to have_link("Sign up")
  end
  scenario "sign up button directs to users/new" do
    visit '/'
    click_link("Sign up")
    expect(page).to have_content("Register as a User below")
    expect(current_path).to eq("/users/new")
  end
end 
