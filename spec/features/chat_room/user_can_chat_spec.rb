require 'rails_helper'
require_relative '../../support/features/chat_helpers.rb'

RSpec.feature "Edit", type: :feature do
  scenario "user can write a message" do
    sign_in
    visit '/rooms/show'
    expect(page).to have_content('make a scream')
  end

  scenario "user can write a message", :focus => true do
    writes_a_message
    visit '/rooms/show'
    find('#write_message').native.send_keys(:return)
    expect(page).to have_content(/Hello, world!/)
  end
end
