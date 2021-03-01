require 'rails_helper'

RSpec.feature "Redirected", type: :feature do
  scenario "to posts route after user registered" do
    sign_up
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
