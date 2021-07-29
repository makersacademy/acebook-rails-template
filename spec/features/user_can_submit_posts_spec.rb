require 'rails_helper'
require_relative 'web_helpers/users_helper.rb'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
<<<<<<< HEAD
    visit "/"
    click_link "New Post"
=======
    signup_login
    click_link "New post"
>>>>>>> 39f4f832797e48c2c6e120aea26dd349d6a497db
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "can submit a post with an uploaded image included" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Image upload test!"
    page.attach_file("Image", Rails.root + "spec/test_assets/test_image_1.png")
    click_button "Submit"
    expect(page).to have_content("Image upload test!")
    expect(page).to have_css("img[src*='test_image_1.png']")  
  end
end
