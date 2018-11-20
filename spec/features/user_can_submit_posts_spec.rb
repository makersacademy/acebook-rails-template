require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can view posts newest first" do
    Timecop.freeze(time = Time.now) do
      visit "/posts"
      click_link "New post"
      fill_in "Message", with: "Hello, world!"
      click_button "Submit"
    end
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Bye, world!"
    click_button "Submit"
    expect(page).to have_content("Bye, world! Posted at: #{time.strftime("%Y-%m-%d %k:%M")}\nHello, world!")
  end

  scenario "Can view posts newest first" do
    Timecop.freeze(time = Time.now) do
      visit "/posts"
      click_link "New post"
      fill_in "Message", with: "Hello, world!"
      click_button "Submit"
    end
      expect(page).to have_content("Posted at: #{time.strftime("%Y-%m-%d %k:%M")}")
  end
end
