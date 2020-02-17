# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    visit('/')
    click_link('Sign Up')
    fill_in 'user[username]', with: 'useronethebest'
    fill_in 'user[email]', with: 'userone@gmail.com'
    fill_in 'user[password]', with: 'secret'
    click_button 'Register'
    fill_in 'post[message]', with: 'Hello, world!'
    click_button 'Add post'
    expect(page).to have_content('Hello, world!')
  end
end
