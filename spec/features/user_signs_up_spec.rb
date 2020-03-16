require 'spec_helper'

RSpec.feature "Sign up", type: :feature do

  scenario "Non-signed up user can't visit any page other than sign_in" do
    visit('/posts')
    expect(current_path).to eq('/users/sign_in')
  end
  
  scenario 'User can sign up' do
    user_sign_up
    expect(current_path).to eq('/')
  end

  scenario "User can only sign up with a email address" do
    user_sign_up('example.com')

    expect(page).to have_content("Email is invalid")
  end

  scenario "User can't sign up with a password less than 6 (inclusive) characters" do
    user_sign_up("testin@example.com", "12345")

    expect(page).to have_content("Password is too short")
  end

  scenario "User can signup with a valid password (6 characters)" do
    user_sign_up("testin@example.com", "123456")

    expect(current_path).to eq('/')
  end

  scenario "User can't sign up with something with password more than 10 (inclusive) characters" do
    user_sign_up("testin@example.com", "12345678910")

    expect(page).to have_content("Password is too long")
  end

end
