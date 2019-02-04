require 'rails_helper'
require 'webhelper'

describe "sign up", type: :feature do
  scenario "user can sign up" do
    go_homepage
    expect(current_path).to eq('/')
  end
end

describe "sign up", type: :feature do
  scenario "user can sign up" do
    go_homepage
    sign_up
    expect(page).to have_content('Currently logged in as test@test.com')
  end
end

describe "Authentication" do
  scenario "User must sign up/in to access posts" do
    go_homepage
    expect(page).to have_content('Sign in', 'Sign up')
    visit '/posts'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
