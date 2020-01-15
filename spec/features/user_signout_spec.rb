require 'rails_helper'

RSpec.feature "User Log Out", type: :feature do

  scenario "logged in user can log out" do
    sign_up('boop@example.com', 'boop123', 'boop123')
    expect(page).to have_link('Sign out')
    click_link("Sign out")
    expect(page).to have_current_path('/users/sign_up')
  end

end
