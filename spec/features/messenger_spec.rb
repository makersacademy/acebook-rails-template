# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Messenger', type: :feature do
  scenario 'User can check who is online' do
    sign_up
    click_button 'Inbox'
    click_link 'Send Messages'
    expect(page).to have_content 'Users Online'
  end

  scenario 'User can check whether a specific friend is online' do
    sign_up
    sign_out
    sign_up2
    click_button 'Inbox'
    click_link 'Send Messages'
    expect(page).to have_content 'Tom | send a message'
  end

  scenario 'Users can send a message to a specific friend' do
    both_users_signup_then_send_tom_msg('hello')
    expect(page).to have_content('hello')
  end

  scenario 'user can view messages sent to them in Inbox page' do
    both_users_signup_then_send_tom_msg('hello matey')
    sign_out
    sign_in
    click_button 'Inbox'
    expect(page).to have_content 'hello matey'
  end

  scenario 'users receive notifications when messaged' do
    Capybara.using_session("Tom's session") do
    end
  end
end
