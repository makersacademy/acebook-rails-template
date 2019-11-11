require 'rails_helper'
require 'timecop'

RSpec.feature "Edit post", type: :feature do
  scenario "Can edit posts and view them" do
    create_user
    login_user
    visit '/posts'
    create_post
    click_link "Edit"
    fill_in "post[message]", with: "Hello again, world!"
    click_button "Update Post"
    expect(page).not_to have_content("Hello, world!")
    expect(page).to have_content("Hello again, world!")
  end

  scenario "User can not edit post created more than 10 min ago" do
    create_user
    login_user
    visit '/posts'
    time = Time.utc(2019, 11, 05, 14, 58, 10)
    Timecop.travel(time)
    create_post
    new_time = Time.utc(2019, 11, 05, 15, 9, 10)
    Timecop.travel(new_time)
    visit '/posts'
    expect(page).to have_no_button "Edit"
    Timecop.return
  end

  scenario "User cannot edit another user's post" do
    create_user
    login_user
    visit '/posts'
    create_post
    logout_user

    create_user_two
    login_user_two
    visit '/posts'
    click_link 'Edit'
    expect(page).to have_content "Hello, world!"
  end
end
