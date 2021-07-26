require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "User can login" do
    signup_login
    expect(page).to have_content("Welcome You are Logged In, jooomin")
  end
end
