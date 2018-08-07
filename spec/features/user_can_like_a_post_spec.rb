require 'rails_helper'

RSpec.feature "Like a post", type: :feature do

  before(:each) do
    successful_sign_up
    first_user_post
    # click_button "Log Out"
    # successful_sign_in_second_user
  end

  scenario "A user can like a post" do
    click_button "Like"
    expect(page).to have_text('test_first_name My first post less than a minute Like 1')
  end

end
