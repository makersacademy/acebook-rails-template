require 'rails_helper'
require 'helpers/create_user'
require 'helpers/user_log_in'

RSpec.feature "User Log out", type: :feature do
  scenario "Signed in users can log out" do
    create_user
    user_log_in
    visit '/'
    click_link "Log Out"
    expect(page).to have_content "Goodbye"
  end
end
