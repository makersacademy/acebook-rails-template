require 'rails_helper'
require 'spec_helper'

def create_comment
  sign_up
  sign_in
  create_post
  click_button('comment-button1')
  fill_in 'comment[body]', with: 'I love cheese'
  click_button('Create Comment')
  visit('/posts')
  click_button('comment-button1')
end
