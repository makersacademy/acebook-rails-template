# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    visit '/sign_up'
    fill_in 'user_username', with: 'username'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign up'
    visit '/posts'

    click_link 'Add new post'

    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Can submit posts and view them in correct order' do
    visit '/sign_up'
    fill_in 'user_username', with: 'username'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign up'
    visit '/posts'
    click_link 'Add new post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Add new post'
    fill_in 'Message', with: 'Hello, world2!'
    click_button 'Submit'
    expect(page).to have_content 'world2'
  end

  scenario 'posts have timestamp' do
    visit '/sign_up'
    fill_in 'user_username', with: 'username'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign up'
    visit '/posts'
    click_link 'Add new post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    t = DateTime.now
    expect(page).to have_text(t.strftime("Posted: %d/%m/%Y"))
  end
end
