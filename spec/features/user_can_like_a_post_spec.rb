require 'rails_helper'

RSpec.feature "Like a post", type: :feature do

  before(:each) do
    successful_sign_up
    first_user_post
  end

  scenario "A user can like a post" do
    click_button "Like"
    expect(page).to have_content('test_first_name My first post less than a minute Delete Update Likes: 1')
  end

end
