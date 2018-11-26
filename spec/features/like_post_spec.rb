require 'rails_helper'
require_relative '../web_helpers.rb'

RSpec.feature 'Likes', type: :feature do
  scenario 'User can like a post' do
    visit_site_sign_up
    hello_world_post
    click_link 'Like'
    expect(page).to have_content("1 like(s)")
  end
end
