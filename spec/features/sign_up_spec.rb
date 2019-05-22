require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
    scenario "Can see Sign Up form" do
      visit "/"
      expect(page).to have_content("Sign Up")
    end
  end