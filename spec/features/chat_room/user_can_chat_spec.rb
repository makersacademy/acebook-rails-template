require 'rails_helper'
require_relative '../../support/features/chat_helpers.rb'

RSpec.feature "Messages", type: :feature do
  scenario "user can visit a chat-room" do
    sign_in
    visit '/rooms/show'
    expect(page).to have_content('make a scream')
  end

  it "POST #create" do
    expect { post :speak, message: { text: 'Cool!' }}.to
      have_broadcasted_to("messages").with(text: 'Cool!')
  end
  xscenario "user can write a message" do
    # writes_a_message
    # sign_in
    visit "/rooms/show"
    fill_in "write_message", with: "Hello, world!"
    click_on 'scream!'
    expect(streams).to have_content(/Hello, world!/)
  end
end
