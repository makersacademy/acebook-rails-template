require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    User.create!(username: "yo man",email: "123@123.123", password: "1234567")
    visit "/"

    fill_in "email", with: "123@123.123"
    fill_in "password", with: "1234567"
    p click_button("Log in")
    
   
    fill_in "post_area", with: "Hello, world!"
    click_button("Post")
    expect(page).to have_content("Hello, world!")
  end
end
