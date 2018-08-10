require 'rails_helper'

RSpec.feature "Unlike a post", type: :feature do

  before(:each) do
    successful_sign_up
    click_link 'Log Out'
    first_user_post
  end

  scenario "A user can unlike a post" do
    click_link "Like"
    click_link "Unlike"
    expect(page).to have_content('test_first_name less than a minute ago My first post Delete Update Like Unlike Likes 0')
    expect(page).to_not have_content('test_first_name less than a minute ago My first post Delete Update Like Unlike Likes 1')

  end

end
