require 'rails_helper'

RSpec.feature 'User', type: :feature do
  scenario 'User can view main posts wall by clicking main post button from welcome screen when logged in' do
    register_user(email = 'test1@test.com')
    visit '/'
    visit '/posts'
    expect(page).to have_content('Main Posts Page')
  end

  scenario 'User can view main posts wall by clicking main post button from welcome screen when logged in' do
    visit '/'
    visit '/posts'
    expect(page).to have_content('Main Posts Page')
  end

  scenario 'If user is logged in and visits root then it redirects to user wall' do
    register_user(email = 'test1@test.com')
    visit '/'
    expect(page).to have_content('Welcome to your wall')
  end
end


# scenario 'User can view main posts wall by clicking main post button from welcome screen' do
#     register_user(email = 'test1@test.com')
#     click_link 'New post'
#     fill_in 'Message', with: 'Hello, world!'
#     click_button 'Submit'
#     register_user(email = 'test2@test.com')
#     click_link 'New post'
#     fill_in 'Message', with: 'Goodbye, world!'
#     click_button 'Submit'
#     visit '/posts'
#     expect(page).to have_content('Hello, world!')
#     expect(page).to have_content('Goodbye, world!')
#   end