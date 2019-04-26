require 'rails_helper'
require 'sign_up_helper'

RSpec.feature "Sign out", type: :feature do
  scenario "User logged in and can see sign out button" do
    create_user_and_sign_up
    expect(page).to have_button("Sign out")
  end
end