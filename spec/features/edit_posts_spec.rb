require 'rails_helper'
require_relative '../web_helpers.rb'

RSpec.feature "Timeline", type: :feature do
  scenario "Can edit posts" do
    visit_site_sign_up
    hello_world_post
    click_link 'Edit'
    fill_in "Message", with: 'Goodbye, world!'
    click_button 'Update'
    expect(page).to have_content "Goodbye, world!"
  end
end
