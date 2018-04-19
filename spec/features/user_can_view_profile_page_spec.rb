# frozen_string_literal: true

require 'rails_helper'
require_relative '../helpers/custom_helper'

RSpec.describe 'Timeline', type: :feature do
  scenario 'User visits profile page through taskbar name' do
    sign_up
    find('#toggleThis').click
    click_link 'testUser'
    expect(page).to have_content('testUser')
  end

  scenario 'User visits profile page through taskbar profile image' do
    sign_up
    find('#toggleThis').click
    find('#user_profile_img_taskbar').click
    expect(page).to have_content('testUser')
  end

  scenario 'User visits profile page through post username link' do
    sign_up
    create_post
    find('#user_post_profile_username').click
    expect(page).to have_content('testUser')
  end

  scenario 'User visits profile page through post user profile image' do
    sign_up
    create_post
    find('#user_post_profile_img').click
    expect(page).to have_content('testUser')
  end
end
