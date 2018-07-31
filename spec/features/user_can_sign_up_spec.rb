require 'rails_helper'

RSpec.feature "SignUp", type: :feature do

    scenario "A user can sign up with valid credentials" do
      visit "/users/new"
      fill_in 'First name', with: "Elishka"
      fill_in 'Last name', with: "Flint"
      fill_in 'Email', with: "elishka@keepingitrails.com"
      fill_in 'Password', with: "pa55w0rd"
      click_button "Sign Up"
      expect(page).to have_content("Welcome Elishka!")
    end

end
