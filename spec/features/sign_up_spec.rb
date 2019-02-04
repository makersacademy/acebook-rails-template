require 'rails_helper'

describe "sign up", type: :feature do
  scenario "user can sign up" do
    visit '/'
    expect(current_path).to eq('/')
  end
end

describe "sign up", type: :feature do
  scenario "user can sign up" do
    visit '/'
    click_link "Sign up"
    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "testpassword"
    fill_in "user[password_confirmation]", with: "testpassword"
    click_button 'Sign up'
    # expect(current_url).to eq('/')
    expect(page).to have_content('Currently logged in as test@test.com')
  end
end

describe "Authentication" do
  scenario "User must sign up/in to access posts" do
    visit '/'
    expect(page).to have_content('Sign in', 'Sign up')
    visit '/posts'
    expect(page).to have_content('YOU MUST BE SIGNED IN TO SEE THIS!!!')
  end
end
