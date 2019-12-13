require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Signed in user can submit posts and view them" do
    visit '/users/sign_up'
    fill_in 'First', with: 'Nat'
    fill_in 'Last', with: 'Yeo'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    page.find("//button[@class='navbar-toggler']").click
    page.find("//nav//a[text() = 'New Post']").click
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
