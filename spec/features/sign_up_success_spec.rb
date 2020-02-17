require 'rails_helper'

RSpec.feature "HomePage", type: :feature do 
   scenario "A user signs up successfully" do 
    sign_up
    expect(page).to have_content("You've successfully signed up!")
    expect(page).to have_content("Welcome to Acebook you are logged in as: test@email.com")
   end
end 