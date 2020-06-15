require 'rails_helper'

RSpec.feature "Log in requirement", type: :feature do
  scenario "User must log in" do
    visit '/posts'
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
