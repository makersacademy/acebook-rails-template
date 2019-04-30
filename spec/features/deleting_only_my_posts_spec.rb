require 'rails_helper'

RSpec.feature "Delete post belonging to another user", type: :feature do

  scenario "User can delete posts" do
    sign_up_helper('test@test.com','123456')
    log_in_helper('test@test.com','123456')
    new_post_helper("This post belongs to Wardah")

    expect(page).to have_content("This post belongs to Wardah")
    click_link "Log out"

    sign_up_helper('test2@test.com','654321')
    log_in_helper('test2@test.com','654321')

    deleteID = Post.find_by(message: "This post belongs to Wardah").id
    find_button(deleteID).click

    expect(page).to have_content("This post belongs to Wardah")
  end
end
