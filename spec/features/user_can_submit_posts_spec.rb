require 'rails_helper'

RSpec.feature "add to there bio as a new user", type: :feature do

  scenario "can create the users bio and view them" do
    sign_up_as_ben()
    click_link "My Page"
    fill_in "Age", with: "50"
    fill_in "Bio", with: "I like long walks and wine"
    fill_in "Location", with: "Swansea"
    click_button "Update"
    expect(page).to have_content("50")
    expect(page).to have_content("I like long walks and wine")
    expect(page).to have_content("Swansea")
  end

  scenario "can create the users bio and view them" do
    generate_fake_users()
    click_link "PaulKane12"
    fill_in "post[text]", with: "nice to see you paul"
    click_button "submit"
    expect(page).to have_content("Messages (1)")
    expect(page).to have_content("nice to see you paul")
    expect(page).to have_content("By BenSmith")
  end

end
