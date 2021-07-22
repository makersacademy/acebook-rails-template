require 'rails_helper'
include Warden::Test::Helpers


RSpec.feature "User authentication", type: :feature do
  scenario "user can sign up" do
    visit "/"
    
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "testing123"
    fill_in "user_password_confirmation", with: "testing123"

    click_button "Sign up"
    expect(page).to have_content("CatBook")
  end
end

# f.email_field :email