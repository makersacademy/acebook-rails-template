require 'rails_helper'
require_relative '../../support/features/chat_helpers.rb'

RSpec.feature "Messages", type: :feature do
  scenario "user can visit a chat-room" do
    sign_in
    visit '/rooms/show'
    expect(page).to have_content('make a scream')
  end

  scenario "user can write a message", :focus => true do
    sign_in
    visit "/rooms/show"
    fill_in "write_message", with: "Hello, world!"
    find_button('submit').click
    visit "/rooms/show"
    expect(page).to have_content(/Hello, world!/)
  end
end
