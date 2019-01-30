require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.new(id: 1))
  end

  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can visit the individual post page and view the post and delete button" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Hello, world!"
    expect(page).to have_content("Hello, world!")
    page.should have_selector(:link_or_button, 'Delete')
  end

end
