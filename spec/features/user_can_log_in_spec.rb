require 'rails_helper'

RSpec.feature "Login", type: :feature do
  scenario "User can view login page" do
    visit "/sessions/new"
    expect(page).to have_selector("input[type=submit][value='Log in']")
  end

  scenario "User can login" do
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
    fill_in('session[email]', with: email)
    fill_in('session[password]', with: password)
    click_button('Log in')
    expect(page).to have_content 'New post'
  end
end

RSpec.feature "UsersLogins", type: :feature do
  scenario "login with invlaid information" do
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
    fill_in('session[email]', with: email)
    fill_in('session[password]', with: 'password')
    click_button('Log in')
    expect(page).to have_content 'Invalid credentials'
  end
end
