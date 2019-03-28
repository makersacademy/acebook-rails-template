require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
    scenario "user can sign up with email and password" do
        visit "/"
        click_link "Sign up"
        fill_in "Email", with: "bob@bob.com"
        fill_in "Password", with: "password1234"
        fill_in "Password confirmation", with: "password1234"
        click_button "Sign Up"
    end
end
