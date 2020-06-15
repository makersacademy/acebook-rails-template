require 'rails_helper'

feature "delete posts" do
  scenario "Can delete my own post" do
    signup()
    add_post("Who wants ice cream, we all want ice cream")
    click_button "Delete6"
    expect(page).not_to have_content("Who wants ice cream, we all want ice cream")

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
