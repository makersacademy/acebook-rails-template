# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'User can edit their own post\'s content' do
    sign_up
    new_post

    visit '/posts'
    click_link 'Edit'
    fill_in 'Message', with: 'Updated Text'
    click_button 'Update Post'
    expect(page).to have_content('Updated Text')
  end

  scenario 'user cannot edit another users posts' do 
    sign_up
    new_post
    visit '/'
    click_link 'Logout'
    sign_up_two
    visit '/posts'
    click_link 'Edit'
    fill_in 'Message', with: 'Updated Text'
    click_button 'Update Post'
    expect(page).to have_content('Sorry you cannot edit another User\'s posts')
    expect(page).to have_content('Hello, world!')
  end

end
