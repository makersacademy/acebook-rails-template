# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and delete them' do
    sign_up
    create_post
    click_link 'Sign out'
    click_link 'Sign up'
    fill_in 'Email', with: 'test@testing.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).not_to have_content('Destroy')
  end
end
