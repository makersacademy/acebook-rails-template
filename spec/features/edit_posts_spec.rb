require 'rails_helper'
require_relative '../web_helpers.rb'

RSpec.feature "Newsfeed", type: :feature do
  scenario "Can edit posts" do
    visit_site_sign_up
    hello_world_post
    edit_post
    expect(page).to have_content "Goodbye, world!"
  end
end
