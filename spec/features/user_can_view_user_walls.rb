require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  before do
    sign_up("email@example.com", "pass12", "pass12")
  end

  scenario "User can see their own wall after sign up" do
    expect(page).to have_current_path('/')
    expect(page).to have_content "Account: email@example.com"
  end

  scenario "User can see their own wall after sign in" do

    click_on "Sign out"
    sign_in("email@example.com", "pass12")
    expect(page).to have_current_path('/')
    expect(page).to have_content "Account: email@example.com"
  end

  scenario "User can see another person's wall" do

    click_on "Sign out"
    sign_up("hello@example.com", "pass12", "pass12")

    visit "/users/100"

    expect(page).to have_content "Account: email@example.com"
  end
end
