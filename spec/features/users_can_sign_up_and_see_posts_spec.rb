require 'rails_helper'

RSpec.feature "User signs up", type: :feature do
  scenario "User signs up and can see posts" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "tesymcemail@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_current_path('/posts')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario "User unable to view posts until they sign up" do
    visit '/posts'
    expect(page).to have_current_path('/')
  end
end
