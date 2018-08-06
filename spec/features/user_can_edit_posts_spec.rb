require 'rails_helper'

RSpec.feature "Edit Posts", type: :feature do

  before(:each) do
    successful_sign_up
    first_user_post
  end

  scenario "A user can delete post from the user homepage" do
    click_link("Update")
    fill_in :message, with: "My changed post"
    click_button "Update"
    expect(page).to have_text('My changed post')
  end

end
