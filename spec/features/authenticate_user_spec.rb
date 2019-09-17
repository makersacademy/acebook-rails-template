require 'rails_helper'

RSpec.feature "Authenticates a user", type: :feature do
    scenario "User cannot visit a psot page wiothout logging in" do
      visit '/posts'
      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
end