require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
    scenario("User can create account") do
        sign_up
        # expect(page).to have_content("test@example.com")
    end
end