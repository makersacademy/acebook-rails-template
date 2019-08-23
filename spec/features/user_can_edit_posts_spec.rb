require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can edit posts and view updated post" do
    p "this is the test"

    user = User.create!(username: "yo man",email: "123@123.123", password: "1234567")
    post = Post.create!(message: "Hello, world!",user_id: "#{user.id}")

    visit "/"

    fill_in "email", with: "123@123.123"
    fill_in "password", with: "1234567"
    click_button("Log in")

    first('.dropdown').first(:link, 'Edit')
    
    fill_in "post_message", with: "Hello, world! edited post"
    click_button('Submit')

    expect(page).to have_content("Hello, world! edited post")
  end
end
