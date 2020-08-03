require 'rails_helper'


RSpec.feature 'Timeline', type: :feature do
  scenario 'Can update posts and view them' do
    register_user
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    
    click_button 'Update post'

    fill_in 'Message', with: 'Goodbye, world!'
    click_button 'Submit'
    expect(page).to have_content('Goodbye, world!')
  end

  scenario 'Cannot update posts with blank message' do
    register_user
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello World!'
    click_button 'Submit'
    
    click_button 'Update post'

    fill_in 'Message', with: ''
    click_button 'Submit'
    expect(page).to have_content('Hello World!')
  end

  scenario 'Cannot update posts with same message' do
    register_user
    
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello World!'
    click_button 'Submit'
    
    click_button 'Update post'

    fill_in 'Message', with: 'Hello World!'
    click_button 'Submit'
    expect(page).to have_content("Not possible. Message has not been changed")
  end

  scenario 'Cannot update user posts belonging to other users' do
    register_user
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello World!'
    click_button 'Submit'
    visit '/users/new'
    fill_in 'user[email]', with: 'test@test1.com'
    fill_in 'user[password]', with: 'test12345'
    click_button 'Create User'
    visit '/posts'
    expect(page).not_to have_selector(:link_or_button, 'Update post')
  end



  # scenario 'cannot update a post if wait longer than wait time' do
  #   p Time.new
  #   visit '/posts'
  #   click_link 'New post'
  #   fill_in 'Message', with: 'Hello, world!'
  #   click_button 'Submit'

  #   Capybara.using_wait_time 5 do
  #     p Time.new
  #     visit '/'
  #     visit '/posts'
  #     within(first('div.posts')) do
  #       click_link('Update post')
  #       p 'do we get here?'
  #       p Time.new
  #     end
  #     expect(page).to have_content("This is the posts feed")
  #   end
  # end
end