require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
  scenario "posts are viewed in ascending age" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "I am post 1"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "I am post 2"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "I am post 3"
    click_button "Submit"
    alltext = page.body
    i1 = alltext.index('I am post 1')
    i2 = alltext.index('I am post 2')
    i3 = alltext.index('I am post 3')
    expect(i3 < i2).to eq true
    expect(i2 < i1).to eq true
  end
end
