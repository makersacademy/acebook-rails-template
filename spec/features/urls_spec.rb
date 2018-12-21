require 'rails_helper'

RSpec.feature "testing for the correct urls", type: :feature do
  scenario "bios list url " do
    visit "/"
    expect(page.current_url).to eq("http://www.example.com/")

  end
  scenario "new bio url " do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    expect(page.current_url).to eq("http://www.example.com/users/sign_up")

  end

  # scenario "new bio url " do
  #   visit "/bios"
  #   click_link "New Bio"
  #   fill_in "Age", with: "20"
  #   fill_in "Bio", with: "likes to eat food"
  #   fill_in "Location", with: "sadly brentford"
  #   click_button "Create Bio"
  #   expect(page.current_url).to eq("http://www.example.com/bios/4")
  #
  # end
  # scenario "returns to bio page when back is pressed after creating bio" do
  #   visit "/bios"
  #   click_link "New Bio"
  #   fill_in "Age", with: "20"
  #   fill_in "Bio", with: "likes to eat food"
  #   fill_in "Location", with: "sadly brentford"
  #   click_button "Create Bio"
  #   click_link "Back"
  #   expect(page.current_url).to eq("http://www.example.com/bios")
  #
  #
  #
  # end
end
