require 'rails_helper'

def creates_a_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    creates_a_post
    expect(page).to have_content("Hello, world!")
  end
end

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view date" do
    creates_a_post
    expect(page).to have_content("#{Time.now.strftime("%Y-%m-%d")}")
  end
end

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view time" do
    creates_a_post
    expect(page).to have_content("#{Time.now.strftime("%k:%M")}")
  end
end
