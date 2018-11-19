require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Posts are shown in reverse chronological order" do
    visit '/posts'
    click_link 'New post'
    fill_in "Message", with: "My first post!"
    click_button "Submit"
    time_1 = Time.now()
    click_link 'New post'
    fill_in "Message", with: "My second post!"
    click_button "Submit"
    time_2 = Time.now()
    expect(page).to have_content("My second post! #{time_2.strftime("%eth %b %Y %T")} My first post! #{time_1.strftime("%eth %b %Y %T")}")
  end
end
