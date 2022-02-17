require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up_user
    
    visit "/"

    fill_in "Message", with: "Hello, world!"
    click_button "Post"
    expect(page).to have_content("Hello, world!")
  end
end
