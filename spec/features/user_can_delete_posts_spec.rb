require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can delete posts and view them if you are the author" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    create_new_post("Hello, world!")
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Delete")
    click_link "Delete"
    expect(page).not_to have_content("Hello, world!")
  end

  scenario "Cannot delete posts and view them if you are not the author" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    create_new_post("Hello, world!")
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content("Delete")
    click_link "LogOut"
    signup_as_new_user("James")
    login_as_user("James")
    visit('/posts')
    click_link "Delete"
    expect(page).to have_content("Hello, world!")
  end
end
