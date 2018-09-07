# frozen_string_literal: true

require 'rails_helper'
require 'cancan/matchers'

RSpec.feature 'Timeline', type: :feature do

  scenario 'Standard User can edit own post' do
    standard_user_posts
    visit ('/posts')  
    click_link 'Edit Post'  
    expect(page).to have_content('Editing Post')   
  end

  scenario 'New Standard User cannot edit someone else post' do
    sign_up_jackbert
    visit ('/posts')   
    expect(page).not_to have_content('Edit Post')
  end

  scenario 'Standard User cannot edit someone else post' do
    standard_user_posts
    visit ('/posts')  
    click_link 'Logout'
    sign_up_jackbert
    visit ('/posts')    
    expect(page).not_to have_content('Edit Post')
  end

  scenario 'Superuser can edit someone else post' do
    standard_user_posts
    visit ('/posts')  
    click_link 'Logout'
    super_user_logs_in
    visit ('/posts')  
    expect(page).to have_content('Edit Post')
  end
end
