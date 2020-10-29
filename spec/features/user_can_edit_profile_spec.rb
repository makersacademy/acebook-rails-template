require 'rails_helper'
require_relative '../helpers/features_helper.rb'

RSpec.feature "Timeline", type: :feature do

  scenario "Can edit a comment" do
    sign_up
    sign_in
    click_link("Edit profile")
    fill_in :user_first_name, with: "Batman"
    fill_in :user_last_name, with: "Chip"
    fill_in :user_current_password, with:"password123"
    find("input[type=submit][value='Update']").click
    expect(page).to have_content("Batman")
    expect(page).to have_content("Chip")
  end
end