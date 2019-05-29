require 'rails_helper'

RSpec.feature "Like", type: :feature do
  scenario "User can like a post once" do
    sign_up_and_login
    click_link "Log out"
    expect(page).to have_content "Log in"
  end
end
