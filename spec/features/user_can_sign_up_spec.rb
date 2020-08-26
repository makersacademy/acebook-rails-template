require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "user sign up button" do
    visit '/' 
    expect(page).to have_link("Sign up")
  end
end 
