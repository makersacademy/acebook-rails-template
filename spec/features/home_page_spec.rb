require 'rails_helper'

RSpec.feature "HomePage", type: :feature do 
   scenario "Can See a sign in and fields for it and sign up link" do 
    visit "/"
     expect(page).to have_button("Sign Up")
     expect(page).to have_button("Login")
   end
end 