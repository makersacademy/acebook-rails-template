require 'rails_helper'

RSpec.feature "User can edit a post", :js => true, type: :feature do
  scenario "User makes a successful edit" do
    user_sign_up

    fill_in "post-message", with: "Hello world!"
    click_button "Post"

    click_link('Edit')

    fill_in 'message', with: 'Totally edited comment'
    click_button "Save"

    expect(page).to have_content("Totally edited comment")
  end
end
