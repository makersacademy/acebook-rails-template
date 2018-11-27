require 'rails_helper'

RSpec.feature 'Commenting', type: :feature do
  scenario 'creating a chatroom' do
    sign_in_as_user
    click_link "Live Chat"
    click_link "New Chat Room"
    fill_in 'chat_room[title]', with: "Test Chat Room"
    click_button "Add"
    expect(page).to have_current_path(chat_rooms_path)
    expect(page).to have_link("Test Chat Room")
  end
end
