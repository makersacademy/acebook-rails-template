require 'rails_helper'
require 'web_helpers'

RSpec.feature "Messages", type: :feature do

  scenario "can send a message" do
    sign_up_mentor
    sign_out
    sign_up_student
    sign_out
    sign_in_mentor
    add_student
    send_message
    expect(page).to have_content("test message")
  end

  scenario "can see current conversations on the dashboard" do
    sign_up_mentor
    sign_out
    sign_up_student
    sign_out
    sign_in_mentor
    add_student
    send_message
    click_link "Back to Your Dashboard"
    expect(page).to have_content("test123@student.com")
  end
end
