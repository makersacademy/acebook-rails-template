require 'rails_helper'
require 'sign_up_helper'
require 'sign_in_helper'
require 'create_post_helper'

RSpec.feature "Like comments", type: :feature do
  scenario "User can like a comment" do
    create_user_and_sign_up
    create_post
    visit '/posts'
    fill_in 'comment_body', with: 'Adding a comment'
    click_button 'Add comment'
    click_button 'Sign out'
    create_second_user_and_sign_in
    visit '/posts'
    click_on(class: 'like-comment-button')
    expect(page).to have_css("#comment_number_of_likes", text: "1")
  end

  scenario "User can unlike a comment they have previously liked" do
    create_user_and_sign_up
    create_post
    visit '/posts'
    fill_in 'comment_body', with: 'Adding a comment'
    click_button 'Add comment'
    click_button 'Sign out'
    create_second_user_and_sign_in
    visit '/posts'
    click_on(class: 'like-comment-button')
    click_on(class: 'unlike-comment-button')
    expect(page).to have_css("#comment_number_of_likes", text: "0")
  end
end
