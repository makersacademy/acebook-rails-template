require 'rails_helper'

RSpec.feature "User can edit a post", type: :feature do
  scenario "User makes a successful edit" do
    user_sign_up

    fill_in "post_message", with: "Hello world!"
    click_button "Post"

    click_link('EDIT')
    expect(page).to have_content("Hello world!")
    sleep 1
    # bip_area post, :message "Totally edited comment!"
    sleep 1

    expect(page).to have_content("Totally edited comment")
  end
end
