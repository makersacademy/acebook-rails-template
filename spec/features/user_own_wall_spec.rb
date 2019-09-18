# frozen_string_literal: true

require 'rails_helper'
require 'clearance_helpers'

RSpec.feature 'Own Wall', type: :feature do
  before do
    sign_up_with('username', 'test@mail.com', 'testing')
  end

  scenario 'user can see posts on their own wall' do
    url = URI.parse(current_url)
    url.request_uri
    click_link 'Add new post'
    fill_in 'Message', with: 'Hello world!'
    click_button 'Submit'
    visit url
    expect(page).to have_content('Hello world!')
  end

  scenario 'User can see other people posts in their own wall' do
    url = URI.parse(current_url)
    url.request_uri
    click_link 'Add new post'
    fill_in 'Message', with: 'Hello world!'
    click_button 'Submit'
    sign_out
    sign_up_with('otherusername', 'othertest@mail.com', 'othertesting')
    visit url
    expect(page).not_to have_content('Edit Post')
  end

  scenario 'users can only see all the posts in the posts section' do
    url = URI.parse(current_url)
    url.request_uri
    click_link 'Add new post'
    fill_in 'Message', with: 'Hello world!'
    click_button 'Submit'
    sign_out
    sign_up_with('otherusername', 'othertest@mail.com', 'othertesting')
    click_link 'Add new post'
    fill_in 'Message', with: 'Hello world again!'
    click_button 'Submit'
    expect(page).to have_content('Hello world!')
    expect(page).to have_content('Hello world again!')
  end
end
