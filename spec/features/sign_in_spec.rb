require 'rails_helper'

RSpec.feature "Sign in", type: :feature do
    scenario("User can sign-in to the account") do
        sign_up

        click_link 'Logout'

        sign_in
        expect(page).to have_content("test@example.com")
        expect(page).to have_content("Signed in successfully.")
    end

    scenario("return error if the password is not correct") do
        sign_up
        click_link 'Logout'
        visit('/users/sign_in')
        fill_in "Email", with: "test@example.com"
        fill_in "Password", with: "boulble"
        click_button "Log in"
        expect(page).to have_content("Invalid Email or password.")   
    end

end 