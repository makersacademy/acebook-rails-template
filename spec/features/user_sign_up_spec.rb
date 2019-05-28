require 'rails_helper'

RSpec.feature "Sign-up", type: :feature do
  scenario "visit sign up page" do
    visit "/users/new"
    expect(page).to have_content("Signup")
  end

  scenario "can sign up" do
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
    expect(page).to have_selector("input[type=submit][value='Log in']")
  end

  scenario "can only sign up with unique email" do
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
