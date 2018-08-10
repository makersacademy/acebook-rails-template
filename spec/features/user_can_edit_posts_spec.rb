require 'rails_helper'

RSpec.feature "Edit Posts", type: :feature do

  before(:each) do
    successful_sign_up
    click_link 'Log Out'
    first_user_post
  end

  scenario "A user can delete post from the user homepage" do
    update_post
    expect(page).to have_text('Your post has been updated')
    expect(page).to have_text("My changed post")
  end

  scenario "A user can update post from the user profile" do
    first(:link, "test_first_name").click
    update_post
    expect(page).to have_text('Your post has been updated')
    expect(page).to have_text("My changed post")
  end

end
