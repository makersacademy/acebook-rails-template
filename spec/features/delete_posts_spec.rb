require 'rails_helper'
require_relative '../web_helpers.rb'

RSpec.feature 'Timeline', type: :feature do
  scenario 'user can delete posts' do
    visit_site_sign_up
    hello_world_post
    expect(page).to have_content 'Hello, world!'
    
    click_link 'Delete'
    expect(page).not_to have_content 'Hello, world!'
    expect(page).to have_content 'New Post'
  end
end
