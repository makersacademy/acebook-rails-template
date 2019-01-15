require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  before :each do
    createUser()
    signin()
  end

  scenario "Can submit posts and view them" do
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can edit a post and see it" do
    signout()
    createUser(email: "new@test.com")
    signin(email: "new@test.com", password: "hello2")
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Edit"
    fill_in "Message", with: "goodbuy"
    click_button "Submit"
    expect(page).to have_content("goodbuy")
  end

  scenario "Can add a post and delete it" do
    signout()
    createUser(email: "new@test.com")
    signin(email: "new@test.com", password: "hello2")
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    all('a', :text => 'Delete')[0].click
    expect(page).not_to have_content("Hello, world!")
  end

end
