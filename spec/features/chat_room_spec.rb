require 'rails_helper'

RSpec.feature 'Chatrooms', type: :feature do
  scenario 'creating a chatroom' do
    sign_in_and_create_chatroom
    expect(page).to have_current_path(chat_rooms_path)
    expect(page).to have_link('Test Chat Room')
  end

  scenario 'entering a chatroom and filling out a message' do
    sign_in_and_create_chatroom
    click_link 'Test Chat Room'
    fill_in 'message[body]', with: 'Test message'
    expect(page).to have_content 'Test Chat Room'
    expect(page).to have_button('Send')
  end

  # scenario 'instant messaging' do
  #   sign_in_and_create_chatroom
  #   click_link 'Test Chat Room'
  #   fill_in 'message[body]', with: 'Test message'
  #   click_button 'Send'
  #   expect(page).to have_content 'Test message'
  # end
end
