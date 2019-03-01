require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/users/sign_in"
    fill_in "user[email]", :with => 'sherif@shendidy.com'
    fill_in "user[password]", :with => '123456'
    click_button "Sign In"
    expect(page).to have_content("Add a new post")
    fill_in "exampleTextarea", :with => 'test message'
    click_button "Add post"
    expect(page).to have_content("test message")
  end
end
