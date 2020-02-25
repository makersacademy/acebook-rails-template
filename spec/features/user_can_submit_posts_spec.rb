require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit('/')
    create_user
    login_user
    fill_in 'post[message]', with: "Hello, world!"
    click_button "Post"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Post user name links to user wall" do
    visit('/')
    create_user
    login_user
    create_post
    logout_user
    create_user_two
    login_user_two
    visit('/posts')
    click_link('HomerSimpson', match: :first)
    expect(current_path).to eq('/users/1')
  end
end
