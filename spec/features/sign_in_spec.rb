require 'rails_helper'

RSpec.feature "Sign in", type: :feature do
    scenario("User can sugn in the the account") do
        sign_up

        click_link 'Logout'

        sign_in
        expect(page).to have_content("test@example.com")
    end
end 