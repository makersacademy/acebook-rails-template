require 'rails_helper'
include Warden::Test::Helpers


RSpec.feature "User authentication", type: :feature do
  scenario "user can sign out" do
    user_sign_up
    click_on 'Sign Out'
    expect(page).to have_content("Sign up")
  end
end