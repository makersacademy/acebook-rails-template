require 'rails_helper'

RSpec.feature "User can edit a comment", :js => true, type: :feature do
  scenario "User makes a successful edit to a comment" do
    user_sign_up

    fill_in "post_message", with: "Hello world in a post!"
    click_button "Post"

    fill_in "post_comment", with: "Hello world in a comment!"
    click_button "Comment"

    expect(page).to have_content("Hello world in a comment!")

    find(".comment").click_link("EDIT")

    fill_in 'comment', with: 'Totally edited comment'
    click_button "Save"

    expect(page.find(:css, '.comment')['innerHTML']).to have_content("Totally edited comment")
  end
end
