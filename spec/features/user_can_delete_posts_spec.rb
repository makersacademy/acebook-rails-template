require 'rails_helper'


RSpec.feature 'Delete', type: :feature do
  scenario 'user can delete their posts' do
    signing_up
    click_link "New post"
    fill_in "Message", with: "Hello Guys!"
    click_button "Submit"
    expect(page).to have_content('Hello Guys!')
    click_link "Delete"
    expect(page).to_not have_content "Hello Guys!"
  end
end
