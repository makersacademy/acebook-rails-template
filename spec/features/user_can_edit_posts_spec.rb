require 'rails_helper'

feature "can edit a post" do
 scenario "create new post then immediately edit it" do
    sign_up
    # create a new post
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    # edit the message text
    click_link "Edit"
    fill_in "post[message]", with: "Goodbye cruel world!"
    click_button "Update"
    # check text on index page
    expect(page).to have_content("Goodbye cruel world!")
  end
end
