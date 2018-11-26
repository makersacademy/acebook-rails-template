require 'rails_helper'
require_relative '../web_helpers.rb'

RSpec.feature 'Timeline', type: :feature do
  before do
    visit_site_sign_up
    hello_world_post
  end

  scenario "shows a comment button" do
    expect(page).to have_content "Comment"
  end

  scenario "allows user to leave comments on posts" do
    fill_in :comment_box, with: "LOL"
    click_button "Comment"
    expect(page).to have_content "LOL"
  end
end
