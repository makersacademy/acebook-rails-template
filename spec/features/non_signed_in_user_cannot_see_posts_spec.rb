require 'rails_helper'

RSpec.feature "Redirect to index", type: :feature do
  scenario "redirects to index if not signed in " do
    visit "/posts"
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end