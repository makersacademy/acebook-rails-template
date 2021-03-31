require 'rails_helper'

feature 'delete_or_edit_posts' do
  before(:each) do
    @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
    @user.save
    sign_in_helper(@user)
    click_link "New Post"
    fill_in "post[message]", with: "Hello Lizard"
    click_button "Submit"
  end

scenario 'delete posts' do
  expect(page).to have_content("Hello Lizard")
  click_button "Delete Post"
  expect(page).not_to have_content("Hello Lizard")
  expect(page).to have_button("New post")
end
end
