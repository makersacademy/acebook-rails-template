require 'rails_helper'

RSpec.feature "User homepage", type: :feature do

  before(:each) do
    successful_sign_up
    first_user_post
  end

  scenario "A user can add a post to their own homepage" do
    expect(page).to have_text('test_first_name My first post less than a minute')
  end

  scenario "Posts display in reverse chronological order" do
    successful_sign_up_second_user
    second_user_post
    expect(page).to have_content('test_first_name2 Second user post less than a minute Delete Update Likes: 0 test_first_name My first post less than a minute')
  end

end
