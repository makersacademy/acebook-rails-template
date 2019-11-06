require 'rails_helper'

RSpec.feature "Create post", type: :feature do
  scenario "User can create posts and view them" do
    create_user
    login_user
    visit '/posts'
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("by John Doe")
  end

  scenario "User can submit posts and view them" do
    time = Time.utc(2019, 11, 05, 14, 58, 10)
    Timecop.freeze(time)
    Post.create(message: "Timecop post")
    create_user
    login_user
    visit '/posts'
    create_post
    expect(page).to have_content "less than a minute ago "
    Timecop.return
  end
end

