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
    # issue with selenium driver, popups wont show in the engine
    # possible turbolinks / cache issues

    Capybara.using_session("Jerry's session") do
      sign_up2

      Capybara.using_session("Tom's session") do
        sign_up_send_msg('Hello Jerry')
      end

      within('div.notification') do
        within('notification') do
          find('notification', visible: true)
        end
      end
      expect(page).to have_content 'Hello Jerry'
    end
  end

  scenario 'users can see whether a friend they are in a conversation with is online' do
    Capybara.using_session("Tom's session") do
      sign_up_send_msg('Hello Jerry')
    end

    Capybara.using_session("Jerry's session") do
      sign_up2
      click_button 'Inbox'
      expect(find(:xpath, path).native.css_value('color')).to eq 'green'
    end
  end
end
