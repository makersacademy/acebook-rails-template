require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts, shows times and dates" do
    sign_up
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button('Submit')
    time_string = Time.now.strftime("%d/%m/%Y %H:%M")
    expect(page).to have_content("Hello, world! #{time_string}")
  end
end
