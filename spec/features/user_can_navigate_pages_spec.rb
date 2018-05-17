# frozen_string_literal: true

require 'rails_helper'
require 'helpers/users_helper_spec'

RSpec.feature 'Timeline', type: :feature do

  scenario 'Can navigate to profile page' do
    first_user
    first_user_sign_in
    click_link 'My Profile'
    expect(page).to have_content('Hello BruceBatman. You are now signed in!')
  end

  scenario 'Can only see their own posts on their profile page' do
    first_user
    second_user
    third_user
    first_user_sign_in
    click_link 'My Profile'
    expect(page).not_to have_content('Superman to the rescue!!!')
  end
end
