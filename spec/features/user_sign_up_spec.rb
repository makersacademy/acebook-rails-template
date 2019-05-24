require 'rails_helper'

RSpec.feature "Sign-up", type: :feature do
    pending scenario "User can sign up" do
    visit "/users/new"
    expect(page).to have_content("Signup")
  end
end

RSpec.feature "User Signup", type: :feature do
  pending scenario "can only sign in with unique email" do
    first_name = 'Bob'
    last_name = 'Geldof'
    email = 'its.me@bobgeldof.com'
    password = 'bob123'

    visit "/users/new"
    fill_in('user[first_name]', with: first_name)
    fill_in('user[last_name]', with: last_name)
    fill_in('user[email]', with: email)
    fill_in('user[password]', with: password)
    click_button('Signup')
    visit "/users/new"
    fill_in('user[first_name]', with: first_name)
    fill_in('user[last_name]', with: last_name)
    fill_in('user[email]', with: email)
    fill_in('user[password]', with: password)
    click_button('Signup')
    expect(page).to have_content 'Email has already been taken'
  end
end
