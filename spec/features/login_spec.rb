require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "Can log in as a user" do
    signup
    login
    expect(page).to have_content("New post")
  end
end
