require 'rails_helper'

RSpec.feature "Session/ Log-out", type: :feature do

  before(:each) do
    successful_sign_up
  end

  scenario "A user can sign in with valid credentials" do
    successful_sign_in
    click_button "Log Out"
    expect(current_path).to eq login_path
  end


end
