require 'rails_helper'
require 'simple_send_keys'
require 'timecop'

RSpec.feature 'edit posts' , type: :feature, js: true do
  scenario 'user can create a post, then add to it' do
    user_sign_up
    create_new_post('Hello world!')
    expect(page).to have_content('Hello world!')
    click_link 'Edit'
    find_field('post_message').send_keys("[Hello everyone!]")
    click_button 'Save Post'
    click_link 'Back to feed'
    expect(page).to have_content("Hello world!Hello everyone!")
  end

  scenario 'user can create a post, then update it' do
    user_sign_up
    create_new_post('Hello world!')
    expect(page).to have_content('Hello world!')
    click_link 'Edit'
    fill_in('post_message', :with => 'Hello everyone!')
    click_button 'Save Post'
    click_link 'Back to feed'
    expect(page).to have_content("Hello everyone!")
    expect(page).not_to have_content("Hello world!")
  end

  scenario 'user cannot edit another users post' do
    user_sign_up
    create_new_post('Hello world!')
    expect(page).to have_content('Hello world!')
    click_button 'Logout'
    second_user_sign_up
    expect(page).to have_content("Hello world!")
    expect(page).not_to have_content("Edit")
    expect(page).to have_no_link('Edit')
  end

  scenario 'user cannot edit another users post' do
    DatabaseCleaner.clean_with(:truncation)
    user_sign_up
    create_new_post('Hello world!')
    expect(page).to have_content('Hello world!')
    click_button 'Logout'
    second_user_sign_up
    visit('/posts/1/edit')
    expect(page).to have_content('Hello world!')
    expect(page.current_path).to eq '/posts'
  end
end
