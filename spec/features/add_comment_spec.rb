require 'rails_helper'

RSpec.feature "Add comment", type: :feature do 
  scenario 'user can add a comment to a post' do
    sign_up
    add_new_post
    click_link "Show"
    click_link "Comment on this post"
    fill_in "Comment", with: "We all need this kind of positivity in our lives"
    click_button "Submit"
    expect(page).to have_content "We all need this kind of positivity in our lives"
  end
end