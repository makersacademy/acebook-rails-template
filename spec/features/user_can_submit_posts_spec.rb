# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    register
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end
end

RSpec.feature 'User Wall', type: :feature do
  scenario 'Signed in user can post on another users wall' do
    register
    submit_post
    click_link 'Sign out'
    register_second_user
    click_link 'Katy Day'
    click_link 'Post on wall'
    fill_in 'Post', with: 'Hello Katy'
    click_button 'Post'
    expect(page).to have_content('Hello Katy')
    expect(page).to have_link('John Smith')
  end 
end 
