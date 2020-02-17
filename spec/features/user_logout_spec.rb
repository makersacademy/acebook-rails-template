require 'rails_helper'
require 'web_helpers'

RSpec.feature "Logout", type: :feature do
  scenario "User can logout after signing in" do
    sign_up

    expect(page).to have_link("Log Out")
  end
end