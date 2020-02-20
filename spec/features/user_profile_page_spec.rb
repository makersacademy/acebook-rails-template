# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Profile', type: :feature do
  scenario 'shows user posts on their profile' do
    sign_up
    visit '/'
    fill_in_form
    click_link 'My Profile'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'test to see if @user is current user' do
    sign_up
    visit '/'
    click_link 'My Profile'
    expect(page).to have_content('ria@testing.com')
  end

  scenario 'when view profile of another user it shows their email' do
    sign_up
    visit '/'
    fill_in_form
    click_link 'Sign out'
    sign_up_2
    visit '/'
    click_link 'View Profile'
    expect(page).to have_content('ria@testing.com')
  end
end
