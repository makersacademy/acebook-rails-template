require "rails_helper"

RSpec.feature "homepage", type: :feature do
  scenario "user visits homepage" do
    visit "/"
    expect(page).to have_content("Sign up")
  end
end
