require 'rails_helper'

RSpec.feature "SignUp", type: :feature do

    scenario "A user can sign up with valid credentials" do
      visit "/"
      fill_in :first_name, with: "Elishka"
      fill_in :last_name, with: "Flint"
      fill_in :email_address, with: "elishka@keepingitrails.com"
      fill_in :password, with: "pa55w0rd"
      click_button "Sign Up"
      expect(page).to have_content("Welcome Elishka!")
    end

end
