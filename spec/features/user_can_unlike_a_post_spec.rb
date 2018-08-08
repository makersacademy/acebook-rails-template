require 'rails_helper'

RSpec.feature "Unlike a post", type: :feature do

  before(:each) do
    successful_sign_up
    click_button 'Log Out'
    first_user_post
  end

  scenario "A user can unlike a post" do
    click_button "Like"
    click_button "Unlike"
    expect(page).to have_content('test_first_name My first post less than a minute Delete Update Likes: 0')
    expect(page).to_not have_content('test_first_name My first post less than a minute Delete Update Likes: 1')

  end

end
