require 'rails_helper'
require 'launchy'

RSpec.feature "Posts", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up
    p ENV['RAILS_ENV']
    save_and_open_page
    add_post
    expect(page).to have_content("Hello, world!")
  end

  scenario "Signed in user can edit posts" do
    sign_up
    save_and_open_page
    add_post
    click_link "Edit"
    fill_in "Message", with: "Goodbye, world!"
    click_button 'Submit'
    expect(page).to have_content("Goodbye, world!")
  end
end
