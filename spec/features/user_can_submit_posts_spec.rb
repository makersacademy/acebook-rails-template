require 'rails_helper'


RSpec.feature "Post", type: :feature do
  scenario "Can submit posts and view them" do

    visit "/users/sign_up"
    fill_in "Email", with: "beep@robot.com"
    fill_in "Password", with: "cyberdog"
    fill_in "Password confirmation", with: "cyberdog"
    click_button "Sign up"

    visit '/'
    fill_in "Username", with: "Robot"
    fill_in "Message", with: "Beep beep"
    click_button "Submit"

    expect(page).to have_css("ul", text: "Beep beep")
    expect(page).to have_css("ul", text: "Robot")
  end

  scenario "Posts are displayed in the correct order" do
    visit "/users/sign_up"
    fill_in "Email", with: "beep@robot.com"
    fill_in "Password", with: "cyberdog"
    fill_in "Password confirmation", with: "cyberdog"
    click_button "Sign up"

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
