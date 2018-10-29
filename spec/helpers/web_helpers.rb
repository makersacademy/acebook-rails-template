# frozen_string_literal: true

def create_hello_world_post
  signup
  visit '/posts'
  click_link 'New Post'
  fill_in 'Message', with: 'Hello, world!'
  click_button 'Submit'
end

def signup
  visit '/'
  click_link 'Sign Up'
  fill_in 'user_email', with: 'tests@mail.com'
  fill_in 'user_password', with: 'test123'
  fill_in 'user_password_confirmation', with: 'test123'
  click_button 'Sign up'
end

def upload_image
  visit '/image_posts/new'
  fill_in 'Caption', with: 'my logo'
  attach_file('Picture', Rails.root + 'spec/fixtures/logo.png')
  click_button('Create Image post')
end
