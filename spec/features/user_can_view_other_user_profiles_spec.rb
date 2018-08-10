require 'rails_helper'

RSpec.feature "User Profile", type: :feature do

  before(:each) do
    successful_sign_up
    click_button "Log Out"
    first_user_post
    click_button "Log Out"
    successful_sign_up_second_user
    click_button "Log Out"
    second_user_post
  end

  scenario "A user can click on a username profile" do
    click_link "test_first_name"
    expect(page).to have_text('test_first_name\'s profile')
  end

end
