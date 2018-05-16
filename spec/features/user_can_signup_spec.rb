require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can signup and " do
    signup_and_login
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end