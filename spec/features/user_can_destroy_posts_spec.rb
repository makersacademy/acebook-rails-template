require 'rails_helper'

feature "can edit a post" do
 scenario "create new post then immediately edit it" do
    sign_up
    # create a new post
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    # edit the message text
    click_link "Destroy"

    expect(page).not_to have_content("Hello, world!")
  end
end
