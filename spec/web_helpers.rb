# frozen_string_literal: true

def signup
  visit('users/new')
  fill_in('Name', with: 'Alfie')
  fill_in('Email', with: 'user@email.com')
  fill_in('Password', with: 'password')
  click_button('Submit')
end

def create_post
  click_link 'New post'
  fill_in 'Message', with: 'Hello, world!'
  click_button 'Submit'
end
