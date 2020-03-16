require 'rails_helper'

RSpec.feature "Redirected to sign up if not in session", type: :feature do
  scenario "see sign up page" do
    visit "/posts/new"
    expect(page).to have_content("Please Sign Up!")
  end
end