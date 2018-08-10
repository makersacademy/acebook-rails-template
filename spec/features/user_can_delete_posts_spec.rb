require 'rails_helper'

RSpec.feature "Delete Posts", type: :feature do

  before(:each) do
    successful_sign_up
    click_link "Log Out"
    first_user_post
  end

  scenario "A user can delete post from the user homepage" do
    click_link "Delete"
    expect(page).to have_text('Your post has been deleted')
    expect(page).not_to have_text('test_first_name My first post less than a minute ago')
  end

  scenario "A user can delete post from the user post page" do
    first(:link, "test_first_name").click
    click_link "Delete"
    expect(page).to have_text('Your post has been deleted')
    expect(page).not_to have_text('test_first_name My first post less than a minute ago')
  end

  scenario "A user can delete a post which has been liked" do
    click_link "Like"
    click_link "Delete"
    expect(page).to have_text('Your post has been deleted')
    expect(page).not_to have_text('test_first_name My first post less than a minute ago')
  end


end
