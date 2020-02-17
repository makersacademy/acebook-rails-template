require 'rails_helper'

RSpec.feature "HomePage", type: :feature do 
   scenario "Login failure" do 
    visit "/"
    click_on 'Login'
    fill_in "email", with: "test2.com"
    fill_in "password", with: "123"
    click_button("Login")
    expect(page).to have_content("Email or Password not valid")
   end
end 