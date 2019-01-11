require 'rails_helper'

RSpec.feature "testing for the correct urls", type: :feature do
  scenario "first page url" do
    visit "/"
    expect(page.current_url).to eq("http://www.example.com/")

  end
  scenario "sign up page url " do
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
end
