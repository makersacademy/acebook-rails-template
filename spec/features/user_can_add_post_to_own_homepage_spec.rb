require 'rails_helper'

RSpec.feature "User homepage", type: :feature do

  before(:each) do
    successful_sign_up
    click_link 'Log Out'
    first_user_post
  end

  scenario "A user can add a post to their own homepage" do
    expect(page).to have_text('test_first_name less than a minute ago My first post')
  end

  scenario "Posts display in reverse chronological order" do
    click_link 'Log Out'
    successful_sign_up_second_user
    click_link 'Log Out'
    second_user_post
    expect(page).to have_content('test_first_name2 less than a minute ago Second user post Delete Update Like Unlike Likes 0 test_first_name less than a minute ago My first post ')
  end

end
