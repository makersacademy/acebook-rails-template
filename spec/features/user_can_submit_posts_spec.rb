# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    visit '/signup'
    fill_in 'users_username', with: 'test'
    fill_in 'users_password', with: 'secret'
    fill_in 'users_email', with: 'test@s.com'
    click_button 'Save Users'
    click_on 'New Post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  
  end
end
