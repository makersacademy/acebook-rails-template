require "rails_helper"
require "support/features/clearance_helpers"

RSpec.feature "Index page has sign up form" do
  scenario "Index page has sign up form" do
    visit('/')

    expect(page).to have_content('Sign Up')
  end
end
