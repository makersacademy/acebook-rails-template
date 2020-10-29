require 'rails_helper'
require_relative '../helpers/features_helper.rb'

RSpec.feature "Timeline", type: :feature do

  scenario "Can comment on a post" do
    sign_up
    sign_in
    add_post

    fill_in :comment_content, with: "I walk the lonely toad"
    find("input[type=submit][value='Submit ']").click
    expect(page).to have_content("I walk the lonely toad")
  end
end

