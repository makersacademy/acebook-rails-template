require 'rails_helper'

RSpec.feature "Sign-up", type: :feature do
  scenario "Root takes you to the signup page" do
    visit "/"
    expect(page).to have_content("Sign-up")
  end
end