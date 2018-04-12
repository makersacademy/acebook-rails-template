require 'rails_helper'
require_relative '../helpers/custom_helper'

RSpec.describe "Timeline", type: :feature do
  scenario "User wants to like a post" do
    sign_up
    create_liked_post
    expect(page).to have_content("Likes:1")
  end
end
