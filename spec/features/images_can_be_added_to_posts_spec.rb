require 'rails_helper'
require 'helpers/create_user'
require 'pry'

feature 'users can attach images to posts' do
  scenario 'user attaches an image' do
    user = User.create(id: 13, name: "Mates", email: "mates@mates.com", password: "Password123")
    visit "/login"
    fill_in "session_email", with: "mates@mates.com"
    fill_in "session_password", with: "Password123"
    click_button "Log in"
    visit new_user_post_path(user)
    fill_in "Message", with: "Hello, world!\n This is a post with multiple \n lines"
    attach_file('Image', "spec/files/images/cat.jpg")
    click_button "Submit"
    expect(page).to have_css("img[src*='cat.jpg']")
  end
end
