require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    pending
    visit('/')
    create_user
    login_user
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Post user name links to user wall" do
    pending
    visit('/')
    create_user
    login_user
    create_post
    logout_user
    create_user_two
    login_user_two
    visit('/posts')
    click_link "HomerSimpson"
    expect(current_path).to eq('/users/1')
  end
end
