require 'rails_helper'

feature "updates posts" do

scenario "Can edit the 5th post and view it updated" do
  signup()
  visit "/posts"
  add_post("I like toast")
  click_button "Edit6"
  fill_in "Message", with: "The 5th post has been changed"
  click_button "Submit"
  expect(page).to have_content("The 5th post has been changed")
end

scenario "doesn't see edit button on not their own post" do
  signup()
  visit "/posts"
  expect{click_button "Edit5"}.to raise_error(Capybara::ElementNotFound)
end

end

def signup()
  visit "/signup"
  fill_in 'signup[username]', with: "Foo"
  fill_in 'signup[password]', with: "Bar"
  fill_in 'signup[email]', with: "Foo@Bar.com"
  click_button "Submit"
end

def add_post(message)
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: message
  click_button "Submit"
end
