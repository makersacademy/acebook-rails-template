# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User Signup', type: :feature do
  before(:each) { visit(new_user_registration_path) }

  scenario 'user can create a new user account' do
    fill_in 'user_first_name', with: 'Jack'
    fill_in 'user_last_name', with: 'Sparrow'
    fill_in 'user_email', with: 'js@test.com'
    fill_in 'user_password', with: 'foobar'
    fill_in 'user_password_confirmation', with: 'foobar'
    click_button 'Sign up'
    expect(page).to have_content('You have signed up successfully')
  end
end
