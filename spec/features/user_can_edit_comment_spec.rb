require 'rails_helper'
require_relative '../helpers/features_helper.rb'

RSpec.feature "Timeline", type: :feature do

  scenario "Can edit a comment" do
    sign_up
    sign_in
    add_post
    add_comment
    find("input[type=submit][value='Edit Comment']").click
    fill_in :comment_content, with: "I walk alone"
    find("input[type=submit][value='Submit']").click
    expect(page).to have_content("I walk alone")
  end
end

