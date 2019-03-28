require 'rails_helper'

feature "updates posts" do

scenario "Can update a post and view the updated post" do
  visit "/posts"
  click_button "Edit1"
  fill_in "Message", with: "A changed post"
  click_button "Submit"
  expect(page).to have_content("A changed post")
end

scenario "Can edit the 5th post and view it updated" do
  visit "/posts"
  click_button "Edit5"
  fill_in "Message", with: "The 5th post has been changed"
  click_button "Submit"
  expect(page).to have_content("The 5th post has been changed")
end

scenario "doesn't see edit button on not their own post" do
  signup()
  visit "/posts"
  expect{click_button "Edit5"}.to raise_error 
end

end

def signup()
  visit "/signup"
  fill_in 'signup[username]', with: "Foo"
  fill_in 'signup[password]', with: "Bar"
  fill_in 'signup[email]', with: "Foo@Bar.com"
  click_button "Submit"
end
