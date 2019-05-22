require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "User can login" do
    visit "/sessions/new"
    expect(page).to have_content("Log in")
  end
end
