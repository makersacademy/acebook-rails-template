require 'rails_helper'

RSpec.feature "View post details", type: :feature do
  scenario "Can view a posts details on its own page" do
    sign_up
    visit('/posts')
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    visit("/posts/#{Post.last.id}")
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can click on posts details link" do
    sign_up
    visit('/posts')
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "New post"
    fill_in "Message", with: "Cat Flap!"
    click_button "Submit"
    first(:link, "Post Details").click
    expect(page).to have_content("Cat Flap!")
    expect(page).not_to have_content("Hello, world!")
  end
end
