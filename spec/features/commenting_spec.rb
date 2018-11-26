require 'rails_helper'

RSpec.feature 'Commenting', type: :feature do
  scenario 'making a comment' do
    sign_in_and_create_post
    click_link 'Comment'
    fill_in 'comment[body]', with: 'A comment'
    click_button('Comment')
    expect(page).to have_content('A comment')
  end

  # scenario 'making an invalid comment' do
  #   user = create(:user)
  #   login_as(user, scope: :user)
  #   post = create(:post)
  #   visit '/posts'
  #   click_link 'Comment'
  #   click_button 'Comment'
  #   expect(page).to have_current_path new_post_comment_path(post)
  # end

  scenario 'viewing comments on the index page' do
    sign_in_and_create_post
    click_link 'Comment'
    fill_in 'comment[body]', with: 'A comment'
    click_button('Comment')
    click_link('Back')
    expect(page).to have_content('A comment')
  end
end
