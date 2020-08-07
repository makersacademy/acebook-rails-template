require 'rails_helper'


RSpec.feature 'Timeline', type: :feature do
  scenario 'Can update posts and view them' do
    register_user
    click_link 'New post'
    fill_in 'post_message', with: 'Hello, world!'
    click_button 'Submit'
    
    click_button 'Update post'

    fill_in 'post_message', with: 'Goodbye, world!'
    click_button 'Submit'
    expect(page).to have_content('Goodbye, world!')
  end

  scenario 'Cannot update posts with blank message' do
    register_user
    click_link 'New post'
    fill_in 'post_message', with: 'Hello World!'
    click_button 'Submit'
    
    click_button 'Update post'

    fill_in 'post_message', with: ''
    click_button 'Submit'
    expect(page).to have_content('Hello World!')
  end

  scenario 'Cannot update posts with same message' do
    register_user
    
    click_link 'New post'
    fill_in 'post_message', with: 'Hello World!'
    click_button 'Submit'
    
    click_button 'Update post'

    fill_in 'post_message', with: 'Hello World!'
    click_button 'Submit'
    expect(page).to have_content("Not possible. Message has not been changed")
  end

  scenario 'Cannot update user posts belonging to other users' do
    register_user
    click_link 'New post'
    fill_in 'post_message', with: 'Hello World!'
    click_button 'Submit'
    register_user('test2@test.com')
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
