require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    signup()
    add_post("Hello, world!")
    expect(page).to have_content("Hello, world!")
    time = Time.new
    expect(page).to have_content("#{time.strftime('%d/%m/%Y')}")
    expect(Post.find_by(signup_id: 2)).to be
  end

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
