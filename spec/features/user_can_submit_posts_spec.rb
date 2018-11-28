require 'rails_helper'
require_relative '../web_helpers.rb'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit_site_sign_up
    hello_world_post
  
    expect(page).to have_content("Hello, world!")
  end
end
