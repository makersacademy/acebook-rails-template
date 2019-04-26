require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them when logged in" do
    # sign up
    sign_up_helper('test@gmail.com', '123')

    # login
    log_in_helper('test@gmail.com', '123')


    # create post
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  xscenario "Cannot submit posts when not logged in" do
    # create post
    visit '/posts'
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to_not have_content("Hello, world!")
  end
end
