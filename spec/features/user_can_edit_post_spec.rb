# frozen_string_literal: true

require 'rails_helper'
require 'cancan/matchers'

RSpec.feature 'Timeline', type: :feature do

  scenario 'Standard User can edit own post' do
    standard_user = create(:user)
    login_as standard_user
    newpost = Post.create(message: 'Console test', user_id: standard_user.id)
    visit ('/posts')  
    click_link 'Edit Post'  
    expect(page).to have_content('Editing Post')
    
  end

  scenario 'Standard User cannot edit someone else post' do
    # login_as create( :user ), scope: :user
    # sign_out :user
    # visit new_post_path
    # expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

  scenario 'Superuser can edit someone else post' do
    # login_as create( :user ), scope: :user
    # sign_out :user
    # visit new_post_path
    # expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
