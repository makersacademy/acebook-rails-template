require 'rails_helper'


RSpec.feature "Post", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/"
    fill_in "post_username", with: "Alistair Phipps"
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_css("ul", text: "Hello, world!")
    expect(page).to have_css("ul", text: "Alistair Phipps")

  end

  scenario "Posts are displayed in the correct order" do
    visit "/"
    fill_in "post_username", with: "Alistair Phipps"
    fill_in "post_message", with: "Hello, world!"
    click_button "Submit"
    fill_in "post_username", with: "Alistair Phipps"
    fill_in "post_message", with: "A later Hello World"
    click_button "Submit"
    expect("A later Hello World").to appear_before("Hello, world!")


  end
end
