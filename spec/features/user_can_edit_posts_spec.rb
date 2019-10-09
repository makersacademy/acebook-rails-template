require 'rails_helper'

RSpec.feature "Post Edit", type: :feature do
  scenario "Can edit posts and view them" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Edit"
    fill_in "Message", with: "Goodbye, world!"
    click_button "Submit"
    expect(page).to have_content("Goodbye, world!")
  end
end
