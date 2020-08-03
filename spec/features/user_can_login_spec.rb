require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "Can signup" do
    signup
    login
    expect(page).to have_content("Listing Posts")
  end
end
