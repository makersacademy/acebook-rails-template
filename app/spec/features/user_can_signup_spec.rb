require 'rails_helper'

RSpec.feature "signup", type: :feature do
  scenario "User can signup" do
    signup
    expect(page).to have_content("Welcome")
  end
end
