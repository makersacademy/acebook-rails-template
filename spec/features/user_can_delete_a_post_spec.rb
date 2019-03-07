require 'rails_helper'


RSpec.feature 'delete', type: :feature do

  scenario 'user can see a delete button' do
    add_a_post
    expect(page).to have_content("Delete")
  end

  scenario 'user can delete a post' do
    add_a_post
    click_link "Delete"
    expect(page).not_to have_content('test message')
  end

  scenario 'user is not allowed to delete other users posts' do
    add_a_post
    click_link "Sign out"
    add_a_post_two
    click_link "See other walls"
    click_link "testUser"
    expect(page).not_to have_content('Delete')
  end

  scenario 'user can delete content on his own wall, posted by others' do
    visit "/users/sign_up"
    fill_in "user[user_name]", :with => 'testUser'
    fill_in "user[email]", :with => 'test@test.com'
    fill_in "user[password]", :with => '123456'
    fill_in "user[password_confirmation]", :with => '123456'
    click_button "Sign up"
    click_link "Sign out"
    add_a_post_two
    click_link "See other walls"
    click_link "testUser"
    fill_in "exampleTextarea", :with => 'test message three'
    click_button "Add post"
    click_link "Sign out"
    click_link "Sign In"
    fill_in "user[email]", :with => 'test@test.com'
    fill_in "user[password]", :with => '123456'
    click_button "Sign In"
    expect(page).to have_content('Delete')

  end


end
