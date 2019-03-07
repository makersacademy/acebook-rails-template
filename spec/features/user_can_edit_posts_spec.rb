require 'rails_helper'
require_relative 'add_a_post_helper'

RSpec.feature 'edit post', type: :feature do
  scenario 'user can edit his posts' do
    add_a_post
    expect(page).to have_link('Edit')
  end

  scenario 'user can see the edited post' do
    add_a_post
    click_link "Edit"
    fill_in "post[message]", :with => 'editted message'
    click_button "Submit"
    expect(page).to have_content 'editted message'
  end

  scenario 'only post owner can edit a post' do
    add_a_post
    click_link 'Sign out'
    visit "/users/sign_up"
    fill_in "user[user_name]", :with => 'testUser2'
    fill_in "user[email]", :with => 'test2@test.com'
    fill_in "user[password]", :with => '1234567'
    fill_in "user[password_confirmation]", :with => '1234567'
    click_button "Sign up"
    expect(page).not_to have_link('Edit')
  end

  # To run this test please ammend the duration in posts/index.html.erb
  # from 600 seconds to 3 seconds only, then change it back to 600 after testing.
  # scenario 'only post owner can edit a post' do
  #   add_a_post
  #   sleep (5)
  #   visit('/posts')
  #   expect(page).not_to have_link('Edit')
  # end

end
