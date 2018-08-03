require 'rails_helper'

RSpec.feature "Session/ Log-out", type: :feature do

  before(:each) do
    successful_sign_up
  end

  scenario "A user can sign in with valid credentials" do
    successful_sign_in
    click_button "Log Out"
    expect(page).should have_selector(:link_or_button, 'Log In')
  end


end
