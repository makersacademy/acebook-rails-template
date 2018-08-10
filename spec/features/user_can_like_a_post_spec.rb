require 'rails_helper'

RSpec.feature "Like a post", type: :feature do

  before(:each) do
    successful_sign_up
    click_link 'Log Out'
    first_user_post
  end

  scenario "A user can like a post" do
    click_link "Like"
    expect(page).to have_content('test_first_name less than a minute ago My first post Delete Update Like Unlike Likes 1')
  end

end
