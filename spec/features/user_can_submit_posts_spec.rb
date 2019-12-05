require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
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
end
