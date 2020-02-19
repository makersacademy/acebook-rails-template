# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Profile', type: :feature do
  scenario 'shows user posts on their profile' do
    sign_up
    visit '/'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Profile'
    expect(page).to have_content('Hello, world!')
  end

  scenario 'test to see if @user is current user' do
    sign_up
    visit '/'
    click_link 'Profile'
    expect(page).to have_content('ria@testing.com')
  end
end
