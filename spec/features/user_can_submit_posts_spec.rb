require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    user_signup('ds.danielh', 'dan@makers.com')
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    date_time = Time.new.strftime("%-d/%-m/%-y %H:%M")
    expect(page).to have_content("Hello, world!")
    expect(page).to have_content(date_time)
  end

  scenario "users see posts in reverse chronological order" do 
    user_signup('ds.danielh', 'dan@makers.com')
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "I should see this message second because I submitted this one before the next one"
    click_button "Submit"
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "I should see this message first because I submitted this one more recently than the last one"
    click_button "Submit"
    expect("I should see this message first because I submitted this one more recently than the last one").to appear_before("I should see this message second because I submitted this one before the next one")
  end
end
