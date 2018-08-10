require 'rails_helper'

RSpec.feature "Session/ Log-out", type: :feature do

  before(:each) do
    successful_sign_up
    click_link 'Log Out'
  end

  scenario "Given a user is signed in, they can log out" do
    successful_sign_in
    click_link 'Log Out'
    expect(current_path).to eq login_path
  end

end
