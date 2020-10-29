require 'rails_helper'
require_relative '../helpers/features_helper.rb'

RSpec.feature "Timeline", type: :feature do

  scenario "Can delete a comment" do
    sign_up
    sign_in
    add_post
    add_comment
    find("input[type=submit][value='Delete Comment']").click
    expect(page).not_to have_content("I walk the lonely road")
  end
end