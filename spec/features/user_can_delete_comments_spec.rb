require 'rails_helper'
require_relative '../helpers/custom_helper'

RSpec.describe "Timeline", type: :feature do
  scenario "User wants to delete a comment, but not a post" do
    sign_up
    create_comment
    click_link 'Delete Comment'
    expect(page).not_to have_content("Hello, Mars!")
  end
end
