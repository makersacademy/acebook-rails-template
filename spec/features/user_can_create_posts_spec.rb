require 'rails_helper'

RSpec.feature "Create post", type: :feature do
  scenario "User can create posts and view them" do
    create_user
    login_user
    visit '/posts'
    fill_in "post[message]", with: "Hello, world!"
    click_button "Create Post"
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("John Doe")
  end

  scenario "User can submit posts and view them" do
    time = Time.utc(2019, 11, 05, 14, 58, 10)
    Timecop.freeze(time)
    Post.create(message: "Timecop post")
    create_user
    login_user
    visit '/posts'
    create_post
    expect(page).to have_content "5 Nov 2019 at 14:58"
    Timecop.return
  end

  scenario "User can see option to post on another users wall" do
    user = create_user
    user_2 = create_user_two
    login_user
    visit "/users/#{user_2.id}"
    create_post
    expect(page).to have_content "Hello, world!"
    visit "/users/#{user.id}"
    expect(page).not_to have_content "Hello, world!"
  end
end
