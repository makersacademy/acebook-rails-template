require 'rails_helper'
require 'sign_up_helper'
require 'create_post_helper'

RSpec.feature "Comment posts", type: :feature do
  scenario "User can comment on any post" do
    create_user_and_sign_up
    create_post
    click_button 'Sign out'
    create_second_user_and_sign_in
    visit '/posts'
    fill_in 'comment_body', with: 'Test adding comment to post'
    click_button 'Add comment'
    expect(page).to have_content 'Test adding comment to post'
  end
end
