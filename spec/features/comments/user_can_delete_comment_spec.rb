require "rails_helper"


RSpec.feature "Timeline", type: :feature do

 scenario "Can delete comments" do
    sign_in
    visit "/posts"
    click_button "+"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Submit"
    fill_in "comment[body]", with: "This is a comment"
    click_button "Create Comment"
    click_button "Delete Comment"

    expect(page).not_to have_content("This is a comment")
  end

  scenario "Can delete comments" do
     sign_in
     visit "/posts"
     click_button "+"
     fill_in "post[message]", with: "Hello, world!"
     click_button "Submit"
     fill_in "comment[body]", with: "This is a comment"
     click_button "Create Comment"
     click_button "Delete Comment"

     expect(page).to have_content("Delete successful")
   end
end
